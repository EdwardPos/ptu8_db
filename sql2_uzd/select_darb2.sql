-- SELECT * FROM darbuotojas;
-- SELECT asmens_kodas, PAVARDĖ , vardas, DIRBA_NUO FROM darbuotojas
--     WHERE DIRBA_NUO = date("2011-02-03");
-- SELECT ASMENS_KODAS, DIRBA_NUO FROM DARBUOTOJAS
--     WHERE DIRBA_NUO BETWEEN date("2009-10-30") AND date("2012-11-11");
-- SELECT VARDAS, SKYRIUS_ID, PROJEKTAS_ID from DARBUOTOJAS
--     WHERE SKYRIUS_ID IN (2, 3);
--SELECT VARDAS, PAVARDĖ, ASMENS_KODAS from DARBUOTOJAS WHERE PAVARDĖ LIKE "%ė";
-- SELECT * FROM DARBUOTOJAS WHERE DIRBA_NUO LIKE "%%02";
-- SELECT PROJEKTAS_ID, count(PROJEKTAS_ID) FROM DARBUOTOJAS;
-- SELECT VARDAS, PAVARDĖ, DIRBA_NUO FROM DARBUOTOJAS
--    ORDER BY DIRBA_NUO ASC;