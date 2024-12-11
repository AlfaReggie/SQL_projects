INSERT INTO person_discounts (id, person_id, pizzeria_id, discount_percent)
  SELECT 
      ROW_NUMBER() OVER() AS id,
      ord.person_id,
      m.pizzeria_id,
      (
          CASE 
              WHEN COUNT(ord.person_id) = 1 THEN 10.50
              WHEN COUNT(ord.person_id) = 2 THEN 22.00
              ELSE 30.00
          END
      ) AS discount_percent
  FROM person_order ord
      JOIN menu m ON ord.menu_id = m.id
  GROUP BY ord.person_id, m.pizzeria_id
  ORDER BY ord.person_id;

SELECT * FROM person_discounts;
