# -*- coding: utf-8 -*-
"""
Created on Sun Aug  7 07:45:10 2016

@author: sandesh
"""
import random
import os
from string import punctuation


def ask(attr):
    basename = 'questions'
    filename = os.path.join(basename, attr)
        
    f = open(filename, 'r')
    ques = random.choice(f.readlines())
    return ques


def get_response(ques):
    pos_res = 0
    neg_res = 0
    positive_response = ['yes', 'yup', 'yeah', 'ok']
    negative_response_response = ['no', 'nope', 'nah']
    user_input = input(ask(ques))
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
