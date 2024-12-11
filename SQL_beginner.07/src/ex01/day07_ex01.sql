SELECT p.name, COUNT(po.id)
FROM person_visits po
	JOIN person p ON p.id = po.person_id
GROUP BY p.name
ORDER BY 2 DESC, 1 ASC