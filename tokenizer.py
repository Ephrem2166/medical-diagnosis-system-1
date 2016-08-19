# -*- coding: utf-8 -*-
"""
Created on Sat Aug  6 20:52:54 2016

@author: sandesh
"""

import nltk
import sys
import MySQLdb as mdb
from nltk.stem.wordnet import WordNetLemmatizer
from nltk.stem.snowball import SnowballStemmer

equivalence = WordNetLemmatizer()
cb = __import__('chatBot')


symptom_attribute = {'name': '', 'site': '', 'onset': '', 'severity': '',
           'pattern': '', 'duration': ''}


def ask_input(question):
    # ask user the supplied question and return answer
    answer = input(question).lower()
    return answer


def tag_input(str):
    # tagging input using nltk.pos_tag()
    input_tokens = nltk.word_tokenize(str)
    tagged_str = nltk.pos_tag(input_tokens)
    return tagged_str


def parse_symptom(lemmatized_noun, lemmatized_adj, symptom):
    try:
        con = mdb.connect('localhost', 'sandesh', 'letmein', 'disease_prediction');

        cur = con.cursor(mdb.cursors.DictCursor)

        combined_list = lemmatized_adj + lemmatized_noun
        for word in combined_list:
            cur.execute(
                "SELECT * FROM symptoms_attribute WHERE Symptom = %s",
                (word,)
            )

            row = cur.fetchone()
            if row:
                sympAttr['name'] = row["Symptom"].lower()
                symptom['name']= row["Symptom"].lower()

                sympAttr['site'] = row["Site"]
                sympAttr['onset'] = row["Onset"]
                sympAttr['severity'] = row["Severity"]
                sympAttr['pattern'] = row["Pattern"]
                sympAttr['duration'] = row["Duration"]

    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()


def parse_symptom_attr(noun_list, adj_list, adv_list, symptom, attribute_name):
    severity_list = ['high', 'moder', 'low', 'mild', 'sever']
    onset_list = ['sudden', 'gradual', 'acut', 'insidi']
    duration_list = ['day', 'week', 'hour']
    pattern_list = ['continu', 'intermitt']

    # Importing site list from file 'site_list' and saving it to list
    site_file = open('site_list', 'r')
    file_content = site_file.read().lower()
    site_list = file_content.splitlines()

    if attribute_name == '' or attribute_name == 'site':
        for noun in noun_list:
            for site in site_list:
                if noun == site:
                    symptom['site'] = noun

    if attribute_name == '' or attribute_name == 'severity':
        for adj in adj_list:
            for word in severity_list:
                if adj == word:
                    symptom['severity'] = adj

    if attribute_name == '' or attribute_name == 'onset':
        for adj in adj_list:
            for word in onset_list:
                if adj == word:
                    symptom['onset'] = adj

        for adv in adv_list:
            for word in onset_list:
                if adv == word:
                    symptom['onset'] = adv

    if attribute_name == '' or attribute_name == 'duration':
        for noun in noun_list:
            for duration in duration_list:
                if noun == duration:
                    symptom['duration'] = noun

    if attribute_name == '' or attribute_name == 'pattern':
        for adj in adj_list:
            for word in pattern_list:
                if adj == word:
                    symptom['pattern'] = adj

        for noun in noun_list:
            for word in pattern_list:
                if noun == word:
                    symptom['pattern'] = noun


def classify_input(user_input, sympt, attribute=''):
    tagged_input = tag_input(user_input)

    stemmer = SnowballStemmer("english")
    # comparing each noun from tagged input to symptoms list
    lemmatized_noun = []
    noun_phrase = list((word for (word, tag) in tagged_input if tag == 'NN' or tag == 'NNS'))
    for word in noun_phrase:
        lemmatized_noun.append(stemmer.stem(equivalence.lemmatize(word)))

    lemmatized_adj = []
    adj_phrase = list((word for (word, tag) in tagged_input if tag == 'JJ' or tag == 'VBG' ))
    for word in adj_phrase:
        lemmatized_adj.append(stemmer.stem(equivalence.lemmatize(word)))

    lemmatized_adv = []
    adv_phrase = list((word for (word, tag) in tagged_input if tag == 'RB'))
    for word in adv_phrase:
        lemmatized_adv.append(stemmer.stem(equivalence.lemmatize(word)))

    if sympt['name'] == '':
        parse_symptom(lemmatized_noun, lemmatized_adj, sympt)
        parse_symptom_attr(lemmatized_noun, lemmatized_adj, lemmatized_adv, sympt, attribute)
    else:
        parse_symptom_attr(lemmatized_noun, lemmatized_adj, lemmatized_adv, sympt, attribute)

    for key in sympt:
        if key == 'name':
            continue
        elif not sympt['name'] == '':
            if sympAttr[key] == 'required' and sympt[key] == '':
                ques = cb.ask(key)
                classify_input(input(ques), sympt, key)


sympAttr = dict(symptom_attribute)