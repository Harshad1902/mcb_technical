CREATE OR REPLACE PROCEDURE task6 (prc out sys_refcursor)
AS
BEGIN open prc for
SELECT
    s.supplier_name AS "Supplier Name",
    s.supplier_contact_name AS "Supplier Contact Name",
    CASE
        WHEN length(s.supplier_contact_number1) = 8 THEN substr(s.supplier_contact_number1, 1, length(s.supplier_contact_number1) - 4) || '-' || substr(s.supplier_contact_number1, 5, length(s.supplier_contact_number1) - 4)
        WHEN length(s.supplier_contact_number1) = 7 THEN substr(s.supplier_contact_number1, 1, length(s.supplier_contact_number1) - 4) || '-' || substr(s.supplier_contact_number1, 4, length(s.supplier_contact_number1) - 3)
    END AS "Supplier Contact No. 1",
    CASE
        WHEN length(s.supplier_contact_number2) = 8 THEN substr(s.supplier_contact_number2, 1, length(s.supplier_contact_number2) - 4) || '-' || substr(s.supplier_contact_number2, 5, length(s.supplier_contact_number2) - 4)
        WHEN length(s.supplier_contact_number2) = 7 THEN substr(s.supplier_contact_number2, 1, length(s.supplier_contact_number2) - 4) || '-' || substr(s.supplier_contact_number2, 4, length(s.supplier_contact_number2) - 3)
    END AS "Supplier Contact No. 3",
    COUNT(o.order_reference)  AS "Total Orders",
    TO_CHAR (o.order_total_amount, '99,999,990.00') AS "Order Total Amount"
FROM supplier s
INNER JOIN orders o ON s.supplier_id = o.order_supplier_id
WHERE o.order_date between '01-JAN-2022' and '31-AUG-2022'
GROUP BY s.supplier_name, s.supplier_contact_name, s.supplier_contact_number1, s.supplier_contact_number2,o.order_total_amount;
End;
/

var rc refcursor

EXEC task6(:rc)
print rc