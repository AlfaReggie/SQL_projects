CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR = 'Dmitriy', pprice INT = 500, pdate DATE = '2022-01-08')
RETURNS TABLE (
        pizzeria_name varchar
) AS $$
        (SELECT DISTINCT pz.name FROM person_visits pv
            JOIN person p ON p.id = pv.person_id
            JOIN pizzeria pz ON pz.id = pv.pizzeria_id
            JOIN menu m ON m.pizzeria_id = pz.id
        WHERE p.name = pperson AND pv.visit_date = pdate AND m.price < pprice)
$$ LANGUAGE sql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300, pdate := '2022-01-01');