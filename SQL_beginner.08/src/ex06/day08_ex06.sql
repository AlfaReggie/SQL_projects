-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
INSERT INTO pizzeria (id, name, rating)
VALUES(11, 'Kazan Pizza 2', 4);
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