import sys

sys.path.append('.')

import src.species


def insert():
    tmp = src.species.Species()
    res = tmp.add()
    print("\n>>")
    for i in res:
        print(i)


insert()
