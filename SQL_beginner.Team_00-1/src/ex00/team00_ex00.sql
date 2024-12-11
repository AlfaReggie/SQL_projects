CREATE TABLE IF NOT EXISTS roads(
  point1 VARCHAR,
  point2 VARCHAR,
  cost INTEGER
);

INSERT INTO roads(point1, point2, cost)
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);

WITH RECURSIVE nodes AS (
    -- Инициализация рекурсивного CTEч
    SELECT point1 AS path,
        point1, 
        point2, 
        cost
    FROM roads
    WHERE point1 = 'a'
    UNION
    -- Подключение к текущей ноде + удлинение пути
    SELECT CONCAT(nodes.path, ',', roads.point1) AS path,
        roads.point1, 
        roads.point2,
        nodes.cost + roads.cost
    FROM nodes
        JOIN roads ON nodes.point2 = roads.point1
    WHERE path NOT LIKE CONCAT('%', roads.point1, '%')
    )

-- Выбор из получившейся CTE таблицы 

SELECT 
    cost AS total_cost,
    CONCAT('{', path, ',a}') AS tour 
FROM nodes 
WHERE LENGTH(path) = 7 -- длина пути в симовлах (включая запятые, но без конечных ,a)
    AND point2 LIKE 'a' -- конечный пункт 'a'
    AND cost = (SELECT cost FROM nodes WHERE LENGTH(path) = 7 AND point2 LIKE 'a' ORDER BY cost LIMIT 1) -- минимальная цена из путей слиной 7
ORDER BY total_cost, tour;
