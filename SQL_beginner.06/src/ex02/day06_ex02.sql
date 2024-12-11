SELECT 
  ps.name, 
  m.pizza_name, 
  m.price,
  (m.price - m.price*psdc.discount_percent/100)::REAL AS discount_price,
  pz.name AS pizzeria_name
FROM person_order po
  JOIN person ps ON ps.id = po.person_id
  JOIN menu m ON m.id = po.menu_id
  JOIN pizzeria pz ON m.pizzeria_id = pz.id
  JOIN person_discounts psdc ON po.person_id = psdc.person_id AND m.pizzeria_id = psdc.pizzeria_id
ORDER BY ps.name, pizzeria_name;
