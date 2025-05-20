from sqlalchemy import create_engine, text
import pandas as pd

server = 'localhost'  # IP-adress
database = 'Bokhandel'
username = 'booksearcher' # User som har rollen db_datareader
password = 'Book1234!' # Har ej gömt lösen eftersom användaren är publik



connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

#Detta är en vy som ligger i boksearchvy.sql
sql_query = text('''SELECT Bocker.Titel, Butiker.Namn AS Butik, LagerSaldo.Saldo
FROM LagerSaldo
INNER JOIN Bocker ON Bocker.ISBN13 = LagerSaldo.ISBN13
INNER JOIN Butiker ON Butiker.ID = LagerSaldo.ButiksID
WHERE Bocker.Titel LIKE :pattern''')

#Query-loop, sökordet hamnar i clause:t LIKE som filtrerar listan i sql-query
#Eftersom Pandas har bra formatering, printar den ut en pandas dataframe
while True:
    print("Sök efter en bok och se dess lagerstatus för respektive butik!")
    search_pattern = input("Ange ett sökord: ")
    df = pd.read_sql(sql_query, engine, params={"pattern": '%' + search_pattern + '%'})
    print(df)
    msg = input("Tryck Enter för ny sökning, ange \'exit\' för att avsluta: ")
    if msg == 'exit':
        print("Välkommen tillbaka!")
        break