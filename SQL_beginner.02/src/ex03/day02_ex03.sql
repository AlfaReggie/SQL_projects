WITH cte_all_dates AS (
  SELECT days::DATE AS missing_date
  FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS days
),
cte_person_visits AS (
  SELECT *
  FROM person_visits
  WHERE person_id IN (1, 2)
    AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
)
SELECT ad.missing_date
FROM cte_all_dates ad
  LEFT JOIN cte_person_visits pv ON ad.missing_date = pv.visit_date
WHERE pv.person_id IS NULL
ORDER BY ad.missing_date;