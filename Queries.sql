SELECT chef_name, SUM(chef_salary) AS total_salary
FROM chef
GROUP BY chef_name
ORDER BY total_salary DESC
LIMIT 3;
--
SELECT AVG(rating) AS average_rating
FROM waiter;
--
SELECT payment_mode, SUM(bill_amount) AS total_revenue
FROM bill
GROUP BY payment_mode;
--
SELECT m.food_item, m.price, SUM(o.num_of_items) AS total_quantity_sold
FROM menu m
LEFT JOIN orders o ON m.menu_id = o.menu_id
GROUP BY m.food_item, m.price
ORDER BY total_quantity_sold DESC;
--
SELECT c.customer_id, c.customer_name, tr.table_no, tr.booking_time, w.waiter_name
FROM customer c
JOIN table_reservation tr ON c.customer_id = tr.customer_id
LEFT JOIN waiter w ON tr.waiter_id = w.waiter_id;
--
SELECT c.customer_id, c.customer_name, b.bill_amount
FROM customer c
JOIN bill b ON c.customer_id = b.customer_id
WHERE b.bill_amount > (SELECT AVG(bill_amount) FROM bill);
--
SELECT w.waiter_id, w.waiter_name, b.bill_amount
FROM waiter w
JOIN table_reservation tr ON w.waiter_id = tr.waiter_id
JOIN bill b ON tr.table_no = b.bill_id
WHERE b.bill_amount = (SELECT MAX(bill_amount) FROM bill);
--
SELECT m.food_item, AVG(o.num_of_items) AS average_quantity_sold
FROM menu m
LEFT JOIN orders o ON m.menu_id = o.menu_id
GROUP BY m.food_item
HAVING average_quantity_sold < (SELECT AVG(num_of_items) FROM orders);
--
SELECT chef_id, chef_name, COUNT(order_id) AS num_orders
FROM chef c
JOIN menu m ON c.speciality = m.food_item
JOIN orders o ON m.menu_id = o.menu_id
GROUP BY chef_id, chef_name
ORDER BY num_orders DESC;
--
SELECT w.waiter_id, w.waiter_name, AVG(c.rating) AS average_customer_rating,
COUNT(o.order_id) AS num_orders
FROM waiter w
LEFT JOIN table_reservation tr ON w.waiter_id = tr.waiter_id
LEFT JOIN orders o ON tr.table_no = o.table_no
LEFT JOIN customer c ON o.customer_id = c.customer_id
GROUP BY w.waiter_id, w.waiter_name
ORDER BY average_customer_rating DESC, num_orders DESC;