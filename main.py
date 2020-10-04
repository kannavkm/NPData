import subprocess as sp

import pymysql.cursors

from local import config

while True:
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

        if con.open:
            print("Connected")

        else:
            print("Failed to connect")
        tmp = input(">>>")

        with con.cursor() as cur:
            while (1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Hire an Employee ")
                print("2. Add a new Department")
                print("3. Hire a User")
                print("4. Add a new Service")
                print("8. Add a feedback for a service")
                print("9. Add a feedback for a feature")
                print("10. Add timings for service")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch >= 100:
                    break
                else:
                    tmp = input("Enter any key to CONTINUE> ")

    except pymysql.err.OperationalError as e:
        print(e.args[0], ':', e.args[1])
        tmp = input(">>>")
