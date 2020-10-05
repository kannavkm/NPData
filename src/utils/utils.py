import subprocess as sp

from pyfiglet import Figlet

import src.utils.syntax_check as syntax


class BgColor:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDCLR = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def psuccess(x):
    print(BgColor.OKGREEN + x + BgColor.ENDCLR)


def perror(x):
    print(BgColor.WARNING + x + BgColor.ENDCLR)


def print_header(x):
    mp = sp.call('clear', shell=True)
    f = Figlet(font='slant')
    print(f.renderText(x))


def ask(func, func2=None):
    def inner():
        if func2 is not None:
            func2()
        func()

    return inner


def to_int(x):
    if syntax.empty(x):
        return None
    else:
        return int(x)


def f(x):
    if x is None:
        return 'NULL'
    elif type(x) is str:
        return "'{}'".format(x)
    else:
        return x


def repeat_and_error(func, func2=None):
    def inner():
        if func2 is not None:
            func2()
        for _ in range(3):
            try:
                if func():
                    break
            except ValueError as e:
                perror('Input is either null or does not match the type expected')
            if _ == 2:
                raise ValueError('Insertion Failed, too many wrong attempts')

    return inner
