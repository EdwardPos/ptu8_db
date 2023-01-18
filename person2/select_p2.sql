SELECT * FROM person;
SELECT * FROM car;
SELECT * from company;

-- WHERE
-- SELECT person.first_name, person.last_name, car.plate
--     FROM person, car
--     WHERE person.car_id = car.id;
-- SELECT last_name, name, make FROM person, company, car 
--     WHERE person.company_id = company.id AND person.car_id = car.id
--     ORDER BY name, make;
-- JOIN
-- SELECT last_name, make, model FROM person JOIN car ON person.car_id = car.id;

-- SELECT last_name, plate, name FROM person
--     JOIN car ON person.car_id = car.id
--     JOIN company ON person.company_id = company.id
--     WHERE company_id=5;

-- SELECT last_name, make, model, plate, name FROM person
--     JOIN car ON person.car_id = car.id
--     JOIN company ON person.company_id = company.id
--     WHERE make = "Ford"
--     ORDER BY name DESC;

-- SELECT name, count(*) as count FROM person
--     JOIN company ON company_id = company.id
--     GROUP BY name
--     HAVING count > 3;

SELECT plate FROM car
    JOIN person ON person.car_id = car.id
    JOIN company ON person.company_id = company.id
    WHERE company.name = "Apple";