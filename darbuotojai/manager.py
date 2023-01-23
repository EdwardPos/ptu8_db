import sqlite3

conn = sqlite3.connect("data/darbuotojai.db")
c = conn.cursor()

while True:
    print("Iveskite nieko kad iseiti")
    paieska = input("Ko ieskom?: ")
    if paieska == "":
        break
    else:
        paieska = f"%{paieska}%"  # 2 budui, bet apriboja pasirinkima
        with conn:
            # 1 nesaugus c.execute(f"SELECT * FROM darbuotojai WHERE pavarde LIKE '%{paieska}%' OR vardas LIKE '%{paieska}%'")  # ' OR 1=1 %'")
            c.execute(
                "SELECT * FROM darbuotojai WHERE pavarde LIKE ? OR vardas LIKE ?", (paieska, paieska))  # saugus
            while True:
                darbuotojas = c.fetchone()
                if darbuotojas:
                    print(darbuotojas)
                else:
                    print("...daugiau nieko nera")
                    break
