(
  SELECT pizzeria.name AS pizzeria_name
  FROM person_visits pv
    INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    INNER JOIN person ON pv.person_id = person.id
  WHERE person.gender = 'female'
  EXCEPT ALL
  SELECT pizzeria.name AS pizzeria_name
  FROM person_visits pv
    INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    INNER JOIN person ON pv.person_id = person.id
  WHERE person.gender = 'male'
)
UNION ALL
(
  SELECT pizzeria.name AS pizzeria_name
  FROM person_visits pv
    INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    INNER JOIN person ON pv.person_id = person.id
  WHERE person.gender = 'male'
  EXCEPT ALL
  SELECT pizzeria.name AS pizzeria_name
  FROM person_visits pv
    INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    INNER JOIN person ON pv.person_id = person.id
  WHERE person.gender = 'female'
)
ORDER BY pizzeria_name;