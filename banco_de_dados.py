import mysql.connector #importa oo pacote Conector
mysqldb=mysql.connector.connect(
    host="localhost",
    user="root",
    password="") #faz a conexão
mycursor=mysqldb.cursor()# o metodo cursor()  cria um obj cursor
mycursor.execute("create database dbteste")#executa a query sql para criar o banco de dados
mysqldb.close()#fecha a conexão

#criando uma tb
mysqldb=mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="dbteste")
mycursor=mysqldb.cursor()
mycursor.execute("create table estudante(roll INT,nome VARCHAR(255), marks INT)")
mysqldb.close()

mycursor=mysqldb.cursor()
try:
   mycursor.execute("insert into estudante values(1,'a',80),(2,'b',89),(3,'c',90)")
   mysqldb.commit()
   print('inserido com sucesso.')
except:
   mysqldb.rollback()
   mysqldb.close()

mycursor=mysqldb.cursor()
try:
   mycursor.execute("select * from estudante")
   resultado=mycursor.fetchall()
   for i in resultado:
      roll=i[0]
      name=i[1]
      marks=i[2]
      print(roll, name, marks)
except:
   print('Error:Unable to fetch data.')
mysqldb.close()

mycursor=mysqldb.cursor()
try:
   mycursor.execute("UPDATE estudante SET name='d', marks=100 WHERE roll=1")
   mysqldb.commit()
   print('atualizado com sucesso')
except:
   mysqldb.rollback()
   mysqldb.close()

mycursor=mysqldb.cursor()
try:
   mycursor.execute("DELETE FROM estudante WHERE roll=3")
   mysqldb.commit()
   print('atualizado com sucesso')
except:
   mysqldb.rollback()
mysqldb.close()
