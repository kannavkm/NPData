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


def repeat_and_error(func, func2=None):
    def inner():
        if func2 is not None:
            func2()
        for _ in range(1, 5):
            try:
                if func():
                    break
            except ValueError as e:
                perror('Input not correct')
            if _ == 4:
                raise ValueError('Insertion Failed, too many wrong attempts')

    return inner