-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- Session #2
COMMIT TRANSACTION;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #1
COMMIT TRANSACTION;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';