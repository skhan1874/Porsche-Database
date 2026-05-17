SELECT VEHICLE.Stock_Number, VEHICLE.vehicle_make, VEHICLE.vehicle_model, CAR.Top_Speed
FROM VEHICLE
INNER JOIN CAR ON VEHICLE.Stock_Number = CAR.CStock_Number;
