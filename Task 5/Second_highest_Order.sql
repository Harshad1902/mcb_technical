CREATE OR REPLACE PROCEDURE Task5 (prc out sys_refcursor)
AS
BEGIN open prc for
SELECT 
    "Order Reference",
    "Order Period",
    "Supplier Name",
    "Order Total Amount",
    "Order Status",
    "Invoice References"
FROM 
    (SELECT orders.*, rownum rnum from
(SELECT 
    CASE 
        WHEN o.order_reference LIKE 'PO00%' THEN REPLACE(o.order_reference, 'PO00', '')
        ELSE REPLACE(o.order_reference, 'PO0', '')
    END     AS "Order Reference",
    TO_CHAR(o.order_date,'fmMonth DD, YYYY') AS "Order Period",
    UPPER(s.supplier_name) AS "Supplier Name",
    TO_CHAR (o.order_total_amount, '99,999,990.00') AS "Order Total Amount",
    o.order_status AS "Order Status",
    LISTAGG(i.invoice_reference, '|') WITHIN GROUP (ORDER BY i.invoice_reference) AS "Invoice References"
FROM invoice i 
INNER JOIN orders o on i.INVOICE_ORDER_ID = o.order_id 
INNER JOIN supplier s on o.ORDER_SUPPLIER_ID = s.SUPPLIER_ID
GROUP BY o.order_reference, o.order_date, s.supplier_name, o.order_total_amount,  o.order_status
order by o.order_total_amount DESC) orders
      where rownum <= 2 )
WHERE rnum >= 2;
End;
/

var rc refcursor

EXEC myproc(:rc)
print rc
