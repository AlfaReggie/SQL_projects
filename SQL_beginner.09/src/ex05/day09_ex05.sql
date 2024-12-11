CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR = 'female')
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
) AS $$
    (SELECT * FROM person WHERE gender = pgender);
$$ LANGUAGE sql;

SELECT * FROM fnc_persons('male');

SELECT * FROM fnc_persons();