INSERT INTO INVOICE (
    INVOICE_ID,
    INVOICE_ORDER_ID,
    INVOICE_REFERENCE,
    INVOICE_DATE
)

-- Header
SELECT DISTINCT
    NULL,
    od.order_id,
    c.invoice_reference,
    to_date(c.invoice_date, 'DD-MM-YYYY') AS invoice_dates
FROM xxbcm_order_mgt c
INNER JOIN order_details o ON c.order_ref = o.order_reference
INNER JOIN orders od on o.ORDER_DETAILS_ORDER_ID = od.ORDER_ID
WHERE c.INVOICE_AMOUNT IS NOT NULL
order by c.invoice_reference, invoice_dates;

