SELECT m.pizza_name, pz.name FROM menu m
JOIN pizzeria pz on m.pizzeria_id = pz.id;

SET enable_seqscan TO ON;
 
EXPLAIN ANALYZE 
  SELECT m.pizza_name, pz.name FROM menu m
  JOIN pizzeria pz on m.pizzeria_id = pz.id;


SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
  SELECT m.pizza_name, pz.name FROM menu m
  JOIN pizzeria pz on m.pizzeria_id = pz.id; 
