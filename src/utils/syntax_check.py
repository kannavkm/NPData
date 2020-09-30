import datetime
import re


def empty(x):
    return len(x) == 0


def validate_email(email):
    regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'

    if re.search(regex, email):
        return True
    else:
        return False


def validate_date(date):
    try:
        year, month, day = map(int, date.split('-'))
        a = datetime.datetime(year=year, month=month, day=day)
        return True
    except ValueError:
        return False


def validate_range(x, lo, hi):
    if x < lo:
        return False
    if x > hi:
        return False
    return True


def validate_phone_number(num):
    regex = '^[0-9]{10}'
