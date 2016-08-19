# compare user provided symptoms with disease in database and return certainty factor

import MySQLdb as mdb
import sys


def get_disease_cf(symptom_list):
    disease_cf = []
    try:
        con = mdb.connect('localhost', 'sandesh', 'letmein', 'diseases');
        cur = con.cursor(mdb.cursors.DictCursor)
        cur.execute("SHOW TABLES")
        disease_list = cur.fetchall()
        for disease in disease_list:
            disease = disease['Tables_in_diseases']
            for symptom in symptom_list:
                cf = 0
                sql = "SELECT * FROM " + disease + " WHERE Symptom = %s"
                cur.execute(
                    sql, (symptom['name'],)
                )

                rows = cur.fetchall()

                for row in rows:
                    if symptom['site'] == row['Site']:
                        score = row['Score']/(2*10) # score scaled by half and normalized
                    else:
                        score = 0

                    cf += score * (1-cf)

            disease_cf.append({'disease': disease, 'certainty': cf})

    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()

    return disease_cf
