def repeat_and_error(func, func2):
    def inner():
        if func2 is not None:
            func2()
        for _ in range(1, 5):
            if func():
                break
            if _ == 4:
                raise ValueError('NOOOOOO')

    return inner
