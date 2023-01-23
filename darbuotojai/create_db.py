import sqlite3
import os

if not os.path.exists('data'):
    os.mkdir('data')

conn = sqlite3.connect('data/darbuotojai.db')
with conn:
    c = conn.cursor()
    c.execute("""
        CREATE TABLE IF NOT EXISTS darbuotojai (
            id INTEGER PRIMARY KEY NOT NULL,
            vardas VARCHAR(50) NOT NULL,
            pavarde VARCHAR(100) NOT NULL,
            atlyginimas DECIMAL(10,2)
        )
    """)
    # c.execute(
    #     "INSERT INTO darbuotojai (vardas, pavarde, atlyginimas) VALUES ('Giedrius', 'Isora', 5555.55);")
    # c.execute(
    #     "INSERT INTO darbuotojai (vardas, pavarde, atlyginimas) VALUES ('Airida', 'Juraitiene', 5555.55);")
    # c.execute(
    #     "INSERT INTO darbuotojai (vardas, pavarde, atlyginimas) VALUES ('Egle', 'Motiejunaite', 5555.55);")
    # c.execute(
    #     "INSERT INTO darbuotojai (vardas, pavarde, atlyginimas) VALUES ('Daiva', 'Reinike', 6666.66);")
    # c.execute(
    #     "INSERT INTO darbuotojai (vardas, pavarde, atlyginimas) VALUES ('Kestutis', 'Bauzys', 7777.77);")

    darbuotojai = [
        ('Egidijus', 'Jankunas', 0),
        ('Gediminas', 'Zakas', 1033.77),
        ('Ignas', 'Rocys', 6789.10),
        ('Kevinas', 'Karpus', 7876.54)
    ]
    c.executemany(
        "INSERT INTO darbuotojai (vardas, pavarde, atlyginimas) VALUES (?, ?, ?)", darbuotojai)
