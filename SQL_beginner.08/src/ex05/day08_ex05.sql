-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
INSERT INTO pizzeria (id, name, rating)
VALUES(10, 'Kazan Pizza', 5);
-- Session #2
COMMIT TRANSACTION;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #1
COMMIT TRANSACTION;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
SELECT SUM(rating)
FROM pizzeria;