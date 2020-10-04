import pymysql.cursors

from local import config


class Database:
    def __init__(self):
        self.con = None

    def open_connection(self):
        self.con = pymysql.connect(
            host='localhost',
            user=config.username,
            password=config.password,
            database=config.db,
            port=config.port,
            cursorclass=pymysql.cursors.DictCursor
        )
        return self.con

    def execute_query(self, query):
        for q in query:
            self.con.execute(q)
