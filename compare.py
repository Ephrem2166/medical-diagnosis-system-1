# compare user provided symptoms with disease in database and return certainty factor

import MySQLdb as mdb
import sys


# structure = __import__('symptoms_structure')
#
# # sympt = structure.Symptom('fever', '', 'acute', '', '', '')
# symptom_list = [
#     # structure.Symptom('fever', '', 'acute', '', '', ''),
#     # structure.Symptom('Sweating', '', 'acute', '', '', ''),
#     structure.Symptom('chill', '', 'acute', '', '', ''),
#     structure.Symptom('cough', '', 'acute', '', '', '')
# ]

def get_disease_CF(symptom_list):
    CF = 0
    try:
        con = mdb.connect('localhost', 'sandesh', 'letmein', 'disease_prediction');

        cur = con.cursor(mdb.cursors.DictCursor)

        for symptom in symptom_list:
            cur.execute(
                "SELECT * FROM Malaria WHERE Symptom = %s",
                (symptom['name'],) # change malaria to generic form
            )

            rows = cur.fetchall()

            for row in rows:
                print(row)
                if symptom['site'] == row['Site']:
                    score = row['Score']/(2*10) # score scaled by half and normalized
                else:
                    score = 0

                CF += score * (1-CF)
    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()

    return CF