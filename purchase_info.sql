SELECT c.customer_ID, c.customer_fname, c.customer_lname, v.vehicle_make, v.vehicle_model, SUM(i.payment) AS total_payment
FROM INVOICE i
JOIN ORDERS o ON i.order_ID = o.order_ID
JOIN CUSTOMER c ON o.customer_ID = c.customer_ID
JOIN VEHICLE v ON i.stock_number = v.stock_number
GROUP BY c.customer_ID, c.customer_fname, c.customer_lname, v.vehicle_make, v.vehicle_model;
