def repeat_and_error(func, func2):
    def inner():
        if func2 is not None:
            func2()
        for _ in range(1, 5):
            try:
                if func():
                    break
            except ValueError as e:
                print('Input not correct')
            if _ == 4:
                raise ValueError('NOOOOOO')

    return inner
