import pymysql.cursors

from local import config
from src.utils.utils import perror, psuccess


class Database:
    def __init__(self):
        self.con = None
        self.cur = None

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

    def get_result(self, query):
        self.cur.execute(query)
        return self.cur.fetchall()

    def execute_query(self, query):
        for qr in query:
            try:
                self.cur.execute(qr)
                self.con.commit()
                psuccess("Success")
            except Exception as e:
                self.con.rollback()
                perror("Failed to execute the operation", e)
                print(">>>>>>>>>>>>>", e)
