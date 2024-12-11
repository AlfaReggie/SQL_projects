SELECT DISTINCT pn.name
FROM person_order po
JOIN person pn ON pn.id = po.person_id
ORDER BY 1