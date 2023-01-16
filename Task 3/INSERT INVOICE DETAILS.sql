INSERT INTO INVOICE_DETAILS (
    INVOICE_DETAILS_ID,
    INVOICE_DETAILS_INVOICE_ID,
    INVOICE_DETAILS_ORDER_DETAILS_ID,
    INVOICE_STATUS,
    INVOICE_HOLD_REASON,
    INVOICE_DESCRIPTION,
    INVOICE_AMOUNT
)

SELECT
    NULL,
    i.invoice_id,
    od.ORDER_DETAILS_ID,
    a.INVOICE_STATUS,
    a.INVOICE_HOLD_REASON,
    a.INVOICE_DESCRIPTION,
    TRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            LOWER(a.INVOICE_AMOUNT)
                            ,',','')
                        ,'o','0')
                    ,'i','1')
                ,'s','5')
            ,' ','')
        ) AS INVOICE_AMOUNT
FROM INVOICE i
INNER JOIN xxbcm_order_mgt a on i.invoice_reference = a.invoice_reference
INNER JOIN orders o on i.invoice_order_id = o.ORDER_ID
inner join order_details od on od.order_reference = a.ORDER_REF;


