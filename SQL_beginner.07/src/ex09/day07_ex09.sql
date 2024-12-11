SELECT address, 
    ROUND(MAX(age)-MIN(age)*1.0/MAX(age), 2)::REAL AS formula, 
    ROUND(AVG(age), 2)::REAL AS average, 
    CASE WHEN MAX(age)-MIN(age)*1.0/MAX(age) > AVG(age) THEN true ELSE false END
FROM person
GROUP BY address
ORDER BY 1;
