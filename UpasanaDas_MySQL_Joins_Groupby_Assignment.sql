-- Q1
SELECT c.name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Q2
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Q3
SELECT o.order_id, c.name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- Q4
SELECT c.name, o.order_id, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Q5
SELECT c.name, oi.product_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id;

-- Q6
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.product_name = 'Soap';

-- Q7
SELECT c.name, c.city, oi.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id;

-- Q8
SELECT order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Q9
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q10
SELECT order_id, COUNT(*) AS total_items
FROM order_items
GROUP BY order_id;

-- Q11
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q12
SELECT c.city, SUM(o.total_amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- Q13
SELECT c.name, AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q14
SELECT product_name, SUM(quantity) AS total_units_sold
FROM order_items
GROUP BY product_name;

-- Q15
SELECT MAX(total_amount) AS highest_order_amount
FROM orders;

-- Q16
SELECT order_date, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_date;

-- Q17
SELECT 
    c.name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_items,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.name;

-- Q18
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;

-- Q19
SELECT product_name,
       SUM(quantity * price) AS total_revenue
FROM order_items
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Q20
SELECT AVG(total_quantity) AS avg_quantity_per_order
FROM (
    SELECT order_id, SUM(quantity) AS total_quantity
    FROM order_items
    GROUP BY order_id
);