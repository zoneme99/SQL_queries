### ER-Diagram
![Alt text](ER_diagram.png)

### Filer

- booksearch.py : Program för att söka upp böcker genom sökord och även se dess lagersaldo per butik.
- boksearchvy.sql : Detta är vyn/sql-query som används i booksearch.py
- forfattarvy.sql : Vy som listar alla författare med Namn, Ålder, Antal Titlar och deras totala lagervärde med deras böcker.
- extravy_orderstatus.sql : Detta är en extravy som listar Ordrar och dess totala tid som man har på sig att utföra ordern och tid kvar tills Deadline, och även volymen på ordern med antalet böcker. Bra att veta är att eftersom det finns mycket tabeller så är all data genererad och därför kan viss data verka märklig såsom att en Order har 5 min på sig att utföras och att skapande-datum är i framtiden.
- ER_diagram.png : Bild på hela databasstrukturen till databas Bokhandel
- Bokhandel.bak : Backup-fil på hela databasen

### Kommentar gällande Store Procedure book_transaction
Har skapat en constraint i LagerSaldo som gör att det inte går att få ett negativt saldo hos en butik vilket skapar dataintigritet.


