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

    except pymysql.err.OperationalError as e:
        print(e.args[0], ':', e.args[1])
        tmp = input(">>>")
