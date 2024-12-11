-- Session #1
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN
-- Session #2
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #1
UPDATE pizzeria SET rating = 5 WHERE name 'Pizza Hut'
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #1
COMMIT;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';