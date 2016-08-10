# -*- coding: utf-8 -*-
"""
Created on Sat Aug  6 20:52:54 2016

@author: sandesh
"""

import nltk
import sys
import MySQLdb as mdb

cb = __import__('chatBot')

from nltk.stem.wordnet import WordNetLemmatizer
equivalence = WordNetLemmatizer()

class SymptomAttr:
    def __init__(self):
        self.name = ''
        self.site = ''
        self.onset = ''
        self.severity = ''
        self.duration = ''

class Symptom:
    def __init__(self):
        self.name = ''
        self.site = ''
        self.onset = ''
        self.severity = ''
        self.duration = ''

    def __str__(self):
        return "Name: " + self.name + '\n' + "Site: " + self.site + '\n' \
        "Onset: " + self.onset + '\n' + "Severity: " + self.severity + '\n' \
        "Duration: " + self.duration + '\n'


#ask user the supplied question and return answer
def ask_input(question):
    answer = input(question).lower()
    return answer

def tag_input(str):
    #tagging input using nltk.pos_tag()
    input_tokens = nltk.word_tokenize(str)
    tagged_input = nltk.pos_tag(input_tokens)
    return tagged_input

user_input = ask_input("What symptom is seen in you?\n")
tagged_input = tag_input(user_input)

severity_list = ['high', 'moderate', 'low']
onset_list = ['sudden', 'gradual']

#Importing site list from file 'site_list' and saving it to list
site_list = []
site_file = open('site_list', 'r')
file_content = site_file.read().lower()
site_list = file_content.splitlines()

#Importing symptoms list from database and saving it to list
sympt = Symptom()


#comparing each noun from tagged input to symptoms list
lemmatized_noun = []
noun_phrase = list((word for (word, tag) in tagged_input if tag == 'NN'))
for word in noun_phrase:
    lemmatized_noun.append(equivalence.lemmatize(word))

lemmatized_adj = []
adj_phrase = list((word for (word, tag) in tagged_input if tag == 'JJ'))
for word in adj_phrase:
    lemmatized_adj.append(equivalence.lemmatize(word))

try:
    con = mdb.connect('localhost', 'sandesh', 'letmein', 'disease_prediction');

    cur = con.cursor(mdb.cursors.DictCursor)

    for noun in lemmatized_noun:
        cur.execute(
            "SELECT * FROM symptoms_attribute WHERE Symptom = %s",
            (noun,)
        )

        row = cur.fetchone()
        if row:
            sympAttr = SymptomAttr()

            sympAttr.name = row["Symptom"].lower()
            sympt.name = row["Symptom"].lower()

            sympAttr.site = row["Site"]
            sympAttr.onset = row["Onset"]
            sympAttr.pattern = row["Pattern"]
            sympAttr.severity = row["Severity"]
            sympAttr.duration = row["Duration"]


except mdb.Error as e:
    print("Error %d: %s" % (e.args[0], e.args[1]))
    sys.exit(1)

finally:
    if con:
        con.close()

if sympt.name != '':
    for noun in lemmatized_noun:
        for site in site_list:
            if noun == site:
                sympt.site = noun

if sympt.name != '':
    for adj in lemmatized_adj:
        for word in severity_list:
            if adj == word:
                sympt.severity = adj

if sympt.name != '':
    for adj in lemmatized_adj:
        for word in onset_list:
            if adj == word:
                sympt.onset = adj

#Ask for required attribute of symptom
if sympt.name != '':
    if sympAttr.site == 'required' and sympt.site == '':
        ques = cb.ask('site')
        sympt.site = input(ques)
    if sympAttr.onset == 'required' and sympt.onset == '':
        ques = cb.ask('onset')
        sympt.onset = input(ques)

print(sympt)


#for word in site_list:
#    print(word)
