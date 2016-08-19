
tokenizer = __import__('tokenizer')
cb = __import__('chatBot')
compare = __import__('compare')


symptom = {'name': '', 'site': '', 'onset': '', 'severity': '',
           'pattern': '', 'duration': ''}


def get_symptoms():
    exit_loop = False
    while not exit_loop:
        sympt = dict(symptom)
        user_input = input(cb.ask('symptom'))
        tokenizer.classify_input(user_input, sympt)
        exit_loop = cb.get_response('quit')
        symptom_list.append(sympt)

symptom_list = []
get_symptoms()

disease_cf = compare.get_disease_cf(symptom_list)
for entry in disease_cf:
    print(entry)
# for entry in disease_cf:
#     if entry['certainty'] < 5:
#         continue
#     elif