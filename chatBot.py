# -*- coding: utf-8 -*-
"""
Created on Sun Aug  7 07:45:10 2016

@author: sandesh
"""
import random
import os


def ask(attr):
    basename = 'questions'
    filename = os.path.join(basename, attr)
        
    f = open(filename, 'r')
    ques = random.choice(f.readlines())
    return ques
