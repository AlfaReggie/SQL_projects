CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT = 10) 
RETURNS TABLE(a BIGINT) AS $$ 
    WITH RECURSIVE cte_f(a, b) AS (
        SELECT 0 AS a,
        1 AS b
        UNION ALL
        SELECT b,
        a + b
        FROM cte_f
        WHERE b < pstop
    )
    SELECT a FROM cte_f;
$$ LANGUAGE SQL;
SELECT *
FROM fnc_fibonacci(1000000000);
SELECT *
FROM fnc_fibonacci();
