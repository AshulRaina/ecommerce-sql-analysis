-- Show all orders with customer names
SELECT orders.order_id, customers.name, orders.order_date
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;

-- Show product names with quantity ordered 
SELECT products.product_name, order_details.quantity
FROM order_details
JOIN products
ON order_details.product_id = products.product_id;

-- Total sales (Revenue)
SELECT SUM(products.price * order_details.quantity) AS total_revenue
FROM order_details
JOIN products
ON order_details.product_id = products.product_id;

-- Total orders per customer
SELECT customers.name, COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;

-- Top-selling product (by quantity)
SELECT products.product_name, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN products
ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_sold DESC;

-- Find customers who placed more than 1 order
SELECT customers.customer_id, customers.name 
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id , customers.name
HAVING COUNT(orders.order_id) > 1;

-- Find total money spent by each customer
SELECT customers.name, SUM(products.price * order_details.quantity) AS spent_total
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
JOIN order_details
ON order_details.order_id = orders.order_id
JOIN products 
ON order_details.product_id = products.product_id
GROUP BY customers.name;

-- Find the customer who spent the MOST money
SELECT customers.name, SUM(products.price * order_details.quantity) AS spent_total
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
JOIN order_details
ON order_details.order_id = orders.order_id
JOIN products 
ON order_details.product_id = products.product_id
GROUP BY customers.name
ORDER BY spent_total DESC LIMIT 1;

-- Find second highest spending customer
SELECT name, spent_total
FROM 
(
    SELECT customers.name, SUM(products.price * order_details.quantity) AS spent_total
    FROM customers
    JOIN orders ON customers.customer_id = orders.customer_id
    JOIN order_details ON order_details.order_id = orders.order_id
    JOIN products ON order_details.product_id = products.product_id
    GROUP BY customers.name
) AS t
ORDER BY spent_total DESC
LIMIT 1 OFFSET 1;

-- Find customers who never placed any order
SELECT customers.name FROM customers 
LEFT JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

