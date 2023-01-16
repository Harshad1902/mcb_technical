INSERT INTO orders (
    ORDER_ID,
    ORDER_SUPPLIER_ID,
    ORDER_REFERENCE,
    ORDER_DATE,
    ORDER_TOTAL_AMOUNT,
    ORDER_STATUS,
    ORDER_DESCIRIPTION
)
-- List of Order Header...
SELECT 
    NULL,
    s.supplier_id,
    c.order_ref,
    to_date (c.order_date, 'DD-MM-YYYY'), -- convert all dates to proper format
    replace(c.order_total_amount,',',''), -- replace all commas
    c.order_status,
    c.order_description
FROM xxbcm_order_mgt c
INNER JOIN supplier s on c.supplier_name = s.supplier_name
WHERE ORDER_LINE_AMOUNT IS NULL;


