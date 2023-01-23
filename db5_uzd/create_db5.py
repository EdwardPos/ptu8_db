import sqlite3
import os

if not os.path.exists('data'):
    os.mkdir('data')

conn = sqlite3.connect('data/db5_uzd.db')
with conn:
    c = conn.cursor()
    c.execute("""
        CREATE TABLE IF NOT EXISTS cars (
            id INTEGER PRIMARY KEY NOT NULL,
            maker VARCHAR(50) NOT NULL,
            model VARCHAR(100) NOT NULL,
            make_date INETEGR NOT NULL,
            color VARCHAR(50) NOT NULL,
            price DECIMAL(10,2)
        )
    """)
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Ford', 'Mondeo', '2017-12-10', 'Blue', 10499.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Ford', 'Escape', '2018-05-05', 'Black', 14400.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Audi', 'A4', '2017-03-01', 'Grey', 18513.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Audi', 'A6', '2019-12-05', 'White', 36300.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Audi', 'Q5', '2018-11-20', 'DarkBlue', 29350.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Volkswagen', 'Golf', '2019-07-20', 'Silver', 10500.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Volkswagen', 'Touareg', '2018-08-20', 'Blue', 47000.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Toyota', 'RAV4', '2019-05-20', 'White', 27900.00);")
    c.execute(
        "INSERT INTO cars (maker, model, make_date, color, price) VALUES ('Toyota', 'Avensis', '2017-04-20', 'Blue', 16900.00);")
