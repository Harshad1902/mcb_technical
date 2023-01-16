INSERT INTO ORDER_DETAILS (
    ORDER_DETAILS_ID,
    ORDER_DETAILS_ORDER_ID,
    ORDER_LINE_AMOUNT,
    ORDER_STATUS,
    ORDER_REFERENCE,
    ORDER_DESCIRIPTION
)

--List of Order Details...
SELECT 
    NULL,
    O.order_id,
    TRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            LOWER(c.order_line_amount)
                            ,',','')
                        ,'o','0')
                    ,'i','1')
                ,'s','5')
            ,' ','')
        ) AS ORDER_LINE_AMOUNT,
    c.order_status,
    c.order_ref,
    c.order_description
FROM xxbcm_order_mgt c
INNER JOIN orders o ON (SUBSTR (c.order_ref,0,INSTR (c.order_ref, '-')-1)) = o.order_reference
WHERE c.order_total_amount IS NULL
;