SELECT pizzeria.name as pizzeria_name
FROM person_visits pv
  JOIN person ON pv.person_id = person.id
  JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
  JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800;