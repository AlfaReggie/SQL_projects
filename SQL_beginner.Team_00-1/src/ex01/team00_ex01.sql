WITH RECURSIVE nodes AS (
    -- Инициализация рекурсивного CTE
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
WHERE LENGTH(path) = 7 -- длина пути в симовлах (включая запятые, без ,a)
    AND point2 LIKE 'a' -- конечный пункт 'a'
    AND (
      cost = (SELECT cost FROM nodes WHERE LENGTH(path) = 7 AND point2 LIKE 'a' ORDER BY cost LIMIT 1) -- минимальная цена из путей длиной 7
      OR
      cost = (SELECT cost FROM nodes WHERE LENGTH(path) = 7 AND point2 LIKE 'a' ORDER BY cost DESC LIMIT 1) -- максимальная цена из путей длиной 7
    )
ORDER BY total_cost, tour;
