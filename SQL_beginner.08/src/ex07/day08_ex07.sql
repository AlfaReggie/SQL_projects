-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- Session #1
UPDATE pizzeria
SET rating = 1
WHERE id = 1;
-- Session #2
UPDATE pizzeria
SET rating = 2
WHERE id = 2;
-- Session #1
UPDATE pizzeria
SET rating = 1
WHERE id = 2;
-- Session #2
UPDATE pizzeria
SET rating = 2
WHERE id = 1;
-- Session #1
COMMIT TRANSACTION;
-- Session #2
COMMIT TRANSACTION;