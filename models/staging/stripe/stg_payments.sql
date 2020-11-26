SELECT 
ID as payment_id,
ORDERID as order_id,
paymentmethod as payment_method,
status,
amount/100 as amount,
created as created_at
FROM "RAW"."STRIPE"."PAYMENT"
