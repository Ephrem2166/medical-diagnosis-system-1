# lemmatize and stem words on the database

import MySQLdb as mdb
import sys
from nltk.stem.wordnet import WordNetLemmatizer
from nltk.stem.snowball import SnowballStemmer

equivalence = WordNetLemmatizer()
stemmer = SnowballStemmer("english")

try:
    con = mdb.connect('localhost', 'sandesh', 'letmein', 'disease_prediction')
    cur = con.cursor(mdb.cursors.DictCursor)

    table = 'symptoms_attribute'

    select_query = "SELECT * FROM " + table
    cur.execute(select_query)
    symptoms = cur.fetchall()
    for row in symptoms:
        sympt = row['Symptom'].split()
        combined_symptom = []
        for word in sympt:
            core_word = stemmer.stem(equivalence.lemmatize(word)).lower()
            combined_symptom.append(core_word)

        symptom = ' '.join(combined_symptom)

        update_column = "UPDATE " + table + " SET Symptom = %s WHERE ID = %s"
        cur.execute(update_column, (symptom, row['ID']))

    # con.commit()

except mdb.Error as e:
    print("Error %d: %s" % (e.args[0], e.args[1]))
    sys.exit(1)

finally:
    if con:
        con.close()