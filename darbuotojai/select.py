import sqlite3

conn = sqlite3.connect("data/darbuotojai.db")
c = conn.cursor()

# with conn:
#     c.execute("SELECT * FROM darbuotojai;")
#     darbuotojai = c.fetchall()

# if darbuotojai:
#     print(darbuotojai)

# c.execute("SELECT * FROM darbuotojai;")  # kaip file.open
# with conn:
#    while True:
#         darbuotojas = c.fetchone()
#         if darbuotojas:
#             print(darbuotojas)
#         else:
#             break

with conn:
    # c.execute("UPDATE darbuotojai SET vardas='Sandra', pavarde='Krisiunaite' WHERE id=3;")
    # c.execute("DELETE FROM darbuotojai WHERE id=4;")
    c.execute("SELECT * FROM darbuotojai;")

while True:
    darbuotojas = c.fetchone()
    if darbuotojas:
        print(darbuotojas)
    else:
        break
