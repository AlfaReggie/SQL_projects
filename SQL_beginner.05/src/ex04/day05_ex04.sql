CREATE INDEX IF NOT EXISTS idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan TO ON;
EXPLAIN ANALYZE
  SELECT pizzeria_id, pizza_name FROM menu
  WHERE pizza_name LIKE '%pizza%' AND pizzeria_id = 1;

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
  SELECT pizzeria_id, pizza_name FROM menu
  WHERE pizza_name LIKE '%pizza%' AND pizzeria_id = 1;
