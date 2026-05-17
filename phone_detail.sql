SELECT C.customer_ID, C.customer_fname, C.customer_lname, CP.main_phone, CP.second_phone
FROM CUSTOMER C
JOIN CUSTOMER_PHONE CP ON C.customer_ID = CP.customer_ID
GROUP BY C.customer_ID, C.customer_fname, C.customer_lname, CP.main_phone, CP.second_phone;
