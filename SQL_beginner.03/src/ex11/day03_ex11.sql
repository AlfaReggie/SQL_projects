UPDATE menu
SET price = ROUND(price * 0.9, 0)
WHERE pizza_name = 'greek pizza';