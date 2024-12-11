SELECT name
FROM (
    SELECT p.name
    FROM person_order po
      JOIN person p ON po.person_id = p.id
      JOIN menu m ON m.id = po.menu_id
    WHERE m.pizza_name = 'pepperoni pizza'
      AND p.gender = 'female'
    INTERSECT
    SELECT p.name
    FROM person_order po
      JOIN person p ON po.person_id = p.id
      JOIN menu m ON m.id = po.menu_id
    WHERE m.pizza_name = 'cheese pizza'
      AND p.gender = 'female'
  ) AS female_pizza_names
ORDER BY name;