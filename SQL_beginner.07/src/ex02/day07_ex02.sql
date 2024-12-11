(SELECT pz.name, COUNT(po.id) AS count,  'order' AS action_type
FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC, 1
LIMIT 3)
UNION
(SELECT pz.name, COUNT(po.id) AS count, 'visit' AS action_type
FROM person_visits po
	JOIN pizzeria pz ON pz.id = po.pizzeria_id
GROUP BY pz.name
ORDER BY 2 DESC, 1
LIMIT 3)
ORDER BY action_type, count DESC;