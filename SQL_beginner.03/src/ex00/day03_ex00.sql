SELECT m.pizza_name AS pizza_name,
  m.price,
  pz.name AS pizzeria_name,
  pv.visit_date
FROM person_visits pv
  INNER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
  INNER JOIN person ON pv.person_id = person.id
  INNER JOIN menu m ON pz.id = m.pizzeria_id
WHERE m.price BETWEEN 800 AND 1000
  AND person.name = 'Kate'
ORDER BY m.pizza_name,
  m.price,
  pz.name;