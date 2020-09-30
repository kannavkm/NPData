import sys

sys.path.append('.')

import src.species


def insert():
    tmp = src.species.Species()
    print(tmp.add())


insert()
