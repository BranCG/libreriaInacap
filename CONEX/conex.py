import mysql.connector
from mysql.connector import Error


def conex():
    try:
        myconn = mysql.connector.connect(host="localhost",
                                        user="root",
                                        passwd="",
                                        database="libreriainacap")
        return myconn
    except Exception as ex:
        print("Error", ex)
        myconn.rollback()
