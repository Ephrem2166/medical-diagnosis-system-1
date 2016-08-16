from string import  punctuation
tokenizer = __import__('tokenizer')
cb = __import__('chatBot')
compare = __import__('compare')


symptom = {'name': '', 'site': '', 'onset': '', 'severity': '',
           'pattern': '', 'duration': ''}


def get_response(ques):
    pos_res = 0
    neg_res = 0
    positive_response = ['yes', 'yup', 'yeah', 'ok']
    negative_response_response = ['no', 'nope', 'nah']
    user_input = input(cb.ask(ques))
    user_input = ''.join(c for c in user_input if c not in punctuation)
    user_input = user_input.split()
    for word in user_input:
        for entry in positive_response:
            if word == entry:
                pos_res = 1
        for entry in negative_response_response:
            if word == entry:
                neg_res = 1

    if pos_res and neg_res:
        get_response('quit')
    elif pos_res:
        return True
    else:
        return False


def get_symptoms():
    exit_loop = False
    while not exit_loop:
        sympt = dict(symptom)
        user_input = input(cb.ask('symptom'))
        tokenizer.classify_input(user_input, sympt)
        exit_loop = get_response('quit')
        symptom_list.append(sympt)

symptom_list = []
get_symptoms()

print(compare.get_disease_CF(symptom_list))