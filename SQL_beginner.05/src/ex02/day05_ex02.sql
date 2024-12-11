CREATE INDEX IF NOT EXISTS idx_person_name ON person(UPPER(name));

SET enable_seqscan TO ON;

EXPLAIN ANALYZE 
  SELECT p.name FROM person p
  JOIN person_order po on po.person_id = p.id;


SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
  SELECT p.name FROM person p
  JOIN person_order po on po.person_id = p.id;