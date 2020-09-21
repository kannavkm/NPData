import subprocess as sp

import pymysql.cursors

import config

while True:
    tmp = sp.call('clear', shell=True)

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(
            host='localhost',
            user=config.username,
            password=config.password,
            database=config.db,
            port=config.port,
            cursorclass=pymysql.cursors.DictCursor
        )
        tmp = sp.call('clear', shell=True)

        if con.open:
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input(">>>")


    except:
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input(">>>")
