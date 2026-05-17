SELECT VEHICLE.vehicle_Year, VEHICLE.vehicle_make, VEHICLE.vehicle_model, VEHICLE.vehicle_price, INVOICE.Invoice_ID, INVOICE.payment
FROM INVOICE
JOIN VEHICLE ON INVOICE.Stock_Number = VEHICLE.Stock_Number
