CREATE OR REPLACE PROCEDURE Order_Summary (prc out sys_refcursor)
AS
BEGIN open prc for
    SELECT 
        "Order Reference",
        "Order Period",
        "Supplier Name",
        "Order Total Amount",
        "Order Status",
        "Invoice Reference",
        "Invoice Total Amount",
        "Action"
    FROM (
    SELECT DISTINCT
        CASE 
            WHEN o.order_reference LIKE 'PO00%' THEN REPLACE(o.order_reference, 'PO00', '')
            ELSE REPLACE(o.order_reference, 'PO0', '')
        END     AS "Order Reference",
        o.order_date,
        substr(o.order_date, 4) AS "Order Period",
        initcap(s.supplier_name) AS "Supplier Name",
        TO_CHAR (o.order_total_amount, '99,999,990.00') AS "Order Total Amount",
        o.order_status AS "Order Status",
        i.invoice_reference AS "Invoice Reference",
        TO_CHAR (id.invoice_amount, '99,999,990.00') AS "Invoice Total Amount",
        CASE
            WHEN id.invoice_status = 'Paid' THEN 'OK'
            WHEN id.invoice_status = 'Pending' THEN 'To follow up'
            ELSE 'To verify'
        END AS "Action"
    FROM orders o
    INNER JOIN supplier s on o.ORDER_SUPPLIER_ID = s.SUPPLIER_ID
    INNER JOIN invoice i on o.order_id = i.INVOICE_ORDER_ID
    INNER JOIN invoice_details id on i.invoice_id = id.invoice_details_invoice_id) TES
    ORDER BY TES.order_date DESC;
END;
/

var rc refcursor

EXEC Order_Summary(:rc)
print rc

--DROP PROCEDURE Order_Summary;
