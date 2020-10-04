import subprocess as sp

import pymysql

import src.utils.database as db

global np

while True:
    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        np = db.Database()

        np.open_connection()

        if np.con.open:
            print("Connected")

        else:
            print("Failed to connect")

        tmp = input(">>>")

        with np.con.cursor() as np.cur:
            while True:
                tmp = sp.call('clear', shell=True)

                tmp = sp.call('clear', shell=True)
                tmp = input("Enter any key to CONTINUE> ")

    except pymysql.err.OperationalError as e:
        print(e.args[0], ':', e.args[1])
        tmp = input(">>>")

