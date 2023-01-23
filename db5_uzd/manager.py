import sqlite3

conn = sqlite3.connect("data/db5_uzd.db")
c = conn.cursor()

while True:
    paieska = int(
        input("1 - ieskoti pagal gamintoja, \n2 - ieskoti pagal modeli,"
              "\n3 - ieskoti pagal pagaminimo metus,"
              "\n4 - ieskoti pagal spalva, \5 - ieskoti pagal kaina,"
              "\6 - pasiulyti nauja automobili, \n0 - baigti paieska")
    )
    if paieska == "0":
        break
    else:
        if paieska == 1:
            paieska = f"%{paieska}%"
        if paieska == 6:
            c.execute("INSERT INTO cars(maker, model, make_date, color, price) VALUES(?,?,?,?,?)",
                      )
        with conn:
            c.execute(
                "SELECT * FROM cars WHERE maker LIKE ? OR model LIKE ?", (paieska, paieska))
            while True:
                cars = c.fetchone()
                if cars:
                    print(cars)
                else:
                    print("Paieska neatitinka parametru")
                    break
