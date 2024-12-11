SELECT m.pizza_name,
  pz.name AS pizzeria_name
FROM person_order po
  INNER JOIN menu m ON m.id = po.menu_id
  INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
  INNER JOIN person p ON po.person_id = p.id
WHERE p.name IN ('Anna', 'Denis') 
ORDER BY 1, 2;