# lemmatize and stem words on the database

import MySQLdb as mdb
import sys
from random import randint

try:
    con_sym = mdb.connect('localhost', 'sandesh', 'letmein', 'disease_prediction')
    con_dis = mdb.connect('localhost', 'sandesh', 'letmein', 'diseases')

    cur_sym = con_sym.cursor(mdb.cursors.DictCursor)
    cur_dis = con_dis.cursor(mdb.cursors.DictCursor)

    cur_dis.execute("SHOW TABLES")
    disease_list = cur_dis.fetchall()

    get_all_sympt = "SELECT ID FROM symptoms_attribute"
    cur_sym.execute(get_all_sympt)
    total_sympt = cur_sym.rowcount

    symptom = []

    for disease in disease_list:
        table = disease['Tables_in_diseases']
        f = open(table, 'w')

        select_query = "SELECT Symptom, Score FROM " + table
        cur_dis.execute(select_query)
        symptoms = cur_dis.fetchall()
        for i in range(1,100):
            symptom = [0] * total_sympt
            for row in symptoms:
                random_num = randint(0,10)
                if row['Score'] > random_num:
                    get_symptom_ID = "SELECT ID FROM symptoms_attribute where Symptom = %s"
                    cur_sym.execute(get_symptom_ID, (row['Symptom'],))
                    sympt = cur_sym.fetchone()
                    symptom_ID = sympt['ID']
                    symptom[symptom_ID-1] = 1

            f.write(' '.join(str(x) for x in symptom) + '\n')

    f.close()

except mdb.Error as e:
    print("Error %d: %s" % (e.args[0], e.args[1]))
    sys.exit(1)

finally:
    if con_sym:
        con_sym.close()

    if con_dis:
        con_dis.close()