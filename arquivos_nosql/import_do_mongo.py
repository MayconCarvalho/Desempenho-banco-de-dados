
from pymongo import MongoClient
import csv
import pandas as pd
"""database = mysql.connector.connect(
    host     = "localhost",
    user     = "root",
    password   = "",
   # database = "nosqldb" #mudar o nome depois
)

cursor=database.cursor() # o metodo cursor()  cria um obj cursor
cursor.execute("create database nosqldb")#executa a query sql para criar o banco de dados
database.close()#fecha a conexão
"""
cliente = MongoClient('localhost', 27017)
cliente = MongoClient('mongodb://localhost:27017/')

banco_mongo = cliente["nosqldb"]
collection = banco_mongo['dados-prouni']

#print(cliente.list_database_names())

def csv_to_json(cursos_prouni, header=None):
        data = pd.read_csv(cursos_prouni.csv, header=header)
        return data.to_dict('records')

collection.insert_many(csv_to_json(r'C:\Users\Florença Morais\Desktop\bd_nosql\cursos_prouni.csv'))



