WITH selected_orders AS
        (SELECT pz.name, count(*) count, 'order' as action_type
        FROM person_order po
            JOIN menu m ON m.id = po.menu_id
            JOIN pizzeria pz on pz.id = m.pizzeria_id
        GROUP BY pz.name
        ORDER BY count DESC, pz.name),
    selected_visits AS
        (SELECT pz.name, count(*) count, 'visit' as action_type
        FROM person_visits pv
            JOIN pizzeria pz on pz.id=pv.pizzeria_id
        GROUP BY pz.name
        ORDER BY count DESC, pz.name)
SELECT selected_orders.name, (selected_orders.count + selected_visits.count) as total_count 
FROM selected_orders
    JOIN selected_visits ON selected_orders.name=selected_visits.name
ORDER BY total_count DESC, name ASC;