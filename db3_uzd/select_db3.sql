SELECT * FROM darbuotojas;
SELECT * FROM PROJEKTAS;
SELECT * FROM SKYRIUS;

--1 su WHERE
-- SELECT VARDAS, PAVARDĖ, projektas.pavadinimas FROM DARBUOTOJAS, PROJEKTAS
--     WHERE PROJEKTAS_ID = projektas.id;
--1 su JOIN
-- SELECT vardas, PAVARDĖ, projektas.pavadinimas FROM darbuotojas
--     JOIN projektas ON projektas_id = projektas.id;

--2
-- select VARDAS, PAVARDĖ, projektas.pavadinimas FROM darbuotojas
--     JOIN projektas ON projektas_id = projektas.id
--     WHERE projektas.pavadinimas = "Galerija";

--3
-- SELECT VARDAS, PAVARDĖ, projektas.pavadinimas, skyrius.pavadinimas FROM darbuotojas
--     JOIN projektas ON projektas_id = projektas.ID
--     JOIN skyrius on skyrius_id = skyrius.id
--     WHERE projektas.pavadinimas = "Projektų valdymas"
--     AND skyrius.pavadinimas = "Pardavimų";

--4
-- SELECT vardas, PAVARDĖ, projektas.pavadinimas FROM darbuotojas
--     JOIN projektas ON projektas_id = projektas.ID
--     WHERE projektas.pavadinimas = "Projektų valdymas" AND PAVARDĖ LIKE "%ė";

--5
-- SELECT skyrius.pavadinimas, count() as count FROM darbuotojas
--     JOIN skyrius ON skyrius_id = skyrius.id
--     GROUP by SKYRIUS_ID;

--6
-- SELECT skyrius.pavadinimas, count() as count FROM darbuotojas
--     JOIN skyrius on skyrius_id = skyrius.ID
--     GROUP BY SKYRIUS_ID
--     HAVING count > 5;

--7
-- SELECT vardas, PAVARDĖ, PAREIGOS, skyrius.pavadinimas FROM darbuotojas
--     left JOIN skyrius ON skyrius_id = skyrius.id
--     WHERE pareigos IS NOT "Vadovas";

--8
-- INSERT INTO darbuotojas (asmens_kodas, vardas, PAVARDĖ, DIRBA_NUO)
--     VALUES ("38807117896", "Pranas", "Logis", "2009-11-12");
-- SELECT * FROM darbuotojas;

--9
-- SELECT vardas, PAVARDĖ, skyrius.pavadinimas FROM darbuotojas
--     left JOIN skyrius ON skyrius_id = skyrius.ID;

--10
SELECT vardas, PAVARDĖ, projektas.pavadinimas FROM darbuotojas
    left JOIN projektas ON projektas_id = projektas.ID
    WHERE projektas.pavadinimas IN (
        SELECT projektas.id FROM projektas
        JOIN darbuotojas ON darbuotojas.projektas_id = projektas.id
        GROUP BY vardas HAVING count() >=4 ORDER BY VARDAS
        );
    