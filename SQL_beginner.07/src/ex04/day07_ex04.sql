SELECT pn.name, count(pv.id)
FROM person_visits pv
JOIN person pn ON pn.id = pv.person_id
GROUP BY pn.name
HAVING count(pv.id) > 3