Start the SQL server (e.g. via XAMPP).

Create a new database -> CREATE DATABASE name_base;

To load data into this database, import the komis.sql file or copy the entire content from the querySQL.txt file and paste it into the SQL query window.

When executing commands from a txt file, some tables will not contain data. By importing the .sql file, all tables will be completed with the relevant information.

The database contains 7 tables:
- clients (klienci)
- workers (pracownicy)
- points of sale (punkty_sprzedazy)
- cars (samochody)
- cars sold (sprzedane_samochody)
- transactions (transakcje)
- payment status (status_platnosci)

The database contains 3 triggers:
1. usun_auto (remove a car) - when records are removed from the Cars table, it is added to the Cars Sold table.
2. dodaj_status (add status) - after adding a record to the Transactions table, an entry is automatically added to the Payment Status table containing payment information.
3. update_status - updating a record in the Transactions table automatically updates the payment information in the Payment Status table.

Function:
1. zmiana_ceny (price change) - the user can enter the price of the car and its fraction value in order to update, e.g. zmiana_ceny(45000,0.95) will reduce the price by 5%.

View:
1. szczegóły_transakcji (transaction details) - the view contains information about the customer (name, surname), the car he bought (brand, model), the price of this vehicle, the name of the points of sale in which he will buy the car, the seller (name, surname) and the date of the transaction.
2. wyniki_sprzedazy (sales results) - the view contains information about the seller (name, surname), point of sale where he works and how many cars the employee has sold.


The file scheme.png contains the database schema and shows the relationship between the tables.

How to use database:
- To sell a car, delete a given record from the cars table.
- Then, add the transaction to the transactions table.