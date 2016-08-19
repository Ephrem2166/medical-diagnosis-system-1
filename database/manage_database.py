# lemmatize and stem words on the database

import MySQLdb as mdb
import sys
from nltk.stem.wordnet import WordNetLemmatizer
from nltk.stem.snowball import SnowballStemmer

equivalence = WordNetLemmatizer()
stemmer = SnowballStemmer("english")

try:
    con = mdb.connect('localhost', 'sandesh', 'letmein', 'diseases')
    cur = con.cursor(mdb.cursors.DictCursor)

    cur.execute("SHOW TABLES")
    disease_list = cur.fetchall()
    for disease in disease_list:
        disease = disease['Tables_in_diseases']

        select_query = "SELECT * FROM " + disease
        cur.execute(select_query)
        symptoms = cur.fetchall()
        for row in symptoms:
            sympt = row['Symptom'].split()
            combined_symptom = []
            for word in sympt:
                core_word = stemmer.stem(equivalence.lemmatize(word)).lower()
                combined_symptom.append(core_word)

            symptom = ' '.join(combined_symptom)

            site = row['Site']
            core_site = stemmer.stem(equivalence.lemmatize(site)).lower()

            onset = row['Onset']
            core_onset = stemmer.stem(equivalence.lemmatize(onset)).lower()

            pattern = row['Pattern']
            core_pattern = stemmer.stem(equivalence.lemmatize(pattern)).lower()

            duration = row['Duration']
            core_duration = stemmer.stem(equivalence.lemmatize(duration)).lower()

            severity = row['Severity']
            core_severity = stemmer.stem(equivalence.lemmatize(severity)).lower()

            update_column = "UPDATE " + disease + " SET Symptom = %s, Site = %s, " \
                                                  "Onset = %s, Pattern = %s, " \
                                                  "Duration = %s, Severity = %s " \
                                                  "WHERE ID = %s"
            cur.execute(update_column, (symptom, core_site, core_onset, core_pattern, core_duration,
                                        core_severity, row['ID']))
    # con.commit()

except mdb.Error as e:
    print("Error %d: %s" % (e.args[0], e.args[1]))
    sys.exit(1)

finally:
    if con:
        con.close()