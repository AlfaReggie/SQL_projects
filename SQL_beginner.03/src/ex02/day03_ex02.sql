SELECT m.pizza_name AS pizza_name,
  m.price,
  pz.name AS pizzeria_name
FROM person_order po
  RIGHT JOIN person ON po.person_id = person.id
  RIGHT JOIN menu m ON m.id = po.menu_id
  RIGHT JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE po.person_id IS NULL
ORDER BY m.pizza_name,
  m.price,
  pz.name;