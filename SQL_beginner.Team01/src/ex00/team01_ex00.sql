WITH
    cte_last_rate AS (
        SELECT C.id, C.name AS currency_name, (
                SELECT rate_to_usd
                FROM currency C
                WHERE
                    C.updated IN (
                        SELECT MAX(currency.updated)
                        FROM currency
                    )
                    AND id = B.currency_id
            ) AS last_rate
        FROM currency C
            JOIN balance B ON B.currency_id = C.id
        GROUP BY
            C.id,
            currency_name,
            B.currency_id
    )
SELECT
    COALESCE(U.name, 'not defined') AS name,
    COALESCE(U.lastname, 'not defined') AS lastname,
    B.type,
    SUM(COALESCE(B.money, 0)) AS volume,
    COALESCE(currency_name, 'not defined') AS currency_name,
    COALESCE(last_rate, 1) as last_rate_to_usd,
    SUM(COALESCE(B.money, 0)) * COALESCE(last_rate, 1) AS total_volume_in_usd
FROM balance B
    FULL JOIN "user" U ON U.id = B.user_id
    Full JOIN cte_last_rate CTE_LC ON B.currency_id = CTE_LC.id
GROUP BY
    type,
    U.id,
    currency_id,
    currency_name,
    last_rate
ORDER BY 1 DESC, 2, 3;