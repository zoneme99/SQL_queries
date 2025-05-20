from sqlalchemy import create_engine, text
# CREATE LOGIN booksearcher
#WITH PASSWORD = 'Book1234!';
# Ersätt dessa med dina faktiska värden
server = 'localhost'  # eller IP-adress
database = 'Bokhandel'
username = 'booksearcher'
password = 'Book1234!'

# Skapa en engine (använd pyodbc som driver)
connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# Exempel på SQL-fråga
sql_query = text("SELECT TOP 10 * FROM Ordrar")

# Kör frågan och skriv ut resultatet
with engine.connect() as connection:
    result = connection.execute(sql_query)
    for row in result:
        print(row)
