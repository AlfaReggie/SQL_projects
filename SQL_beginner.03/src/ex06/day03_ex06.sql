SELECT menu1.pizza_name,
  pz1.name AS pizzeria_name_1,
  pz2.name AS pizzeria_name_2,
  menu1.price
FROM menu AS menu1
  INNER JOIN menu AS menu2 ON menu1.price = menu2.price
  INNER JOIN pizzeria pz1 ON menu1.pizzeria_id = pz1.id
  INNER JOIN pizzeria pz2 ON menu2.pizzeria_id = pz2.id
WHERE menu1.id > menu2.id
  AND menu1.pizza_name = menu2.pizza_name
ORDER BY pizza_name;