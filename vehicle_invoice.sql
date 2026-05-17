SELECT v.vehicle_make, v.vehicle_model, v.vehicle_year, v.vehicle_price price, i.invoice_ID, i.payment
FROM INVOICE i
JOIN VEHICLE v ON i.stock_number = v.stock_number;
