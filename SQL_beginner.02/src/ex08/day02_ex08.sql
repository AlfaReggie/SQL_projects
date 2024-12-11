SELECT p.name
FROM person_order po
  JOIN person p ON po.person_id = p.id
  JOIN menu m ON m.id = po.menu_id
WHERE m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
  AND p.address IN ('Moscow', 'Samara')
  AND p.gender = 'male'
ORDER BY p.name DESC;