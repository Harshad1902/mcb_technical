INSERT INTO supplier (
    SUPPLIER_ID,
    SUPPLIER_NAME,
    SUPPLIER_CONTACT_NAME,
    SUPPLIER_CONTACT_NUMBER1,
    SUPPLIER_CONTACT_NUMBER2,
    SUPPLIER_EMAIL,
    SUPPLIER_ADDRESS
)
--insert of suppliers...
SELECT DISTINCT 
    NULL,
    supplier_name,
    supp_contact_name,
    -- SPLIT THE FIRST NUMBER AND REPLACE CHARACTES AS o, i and s and put them in lower case 
    TRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            LOWER(SUBSTR (SUPP_CONTACT_NUMBER,0,INSTR (SUPP_CONTACT_NUMBER, ',')-1))
                            ,'.','')
                        ,'o','0')
                    ,'i','1')
                ,'s','5')
            ,' ','')
        ) AS SUPPLIER_CONTACT_NUMBER1,
    -- SPLIT THE SECOND NUMBER AND REPLACE SPACE and CHARACTES AS o, i and s and put them in lower case
    TRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            LOWER(SUBSTR (SUPP_CONTACT_NUMBER,INSTR (SUPP_CONTACT_NUMBER, ',')+1))
                            ,'.','')
                        ,'o','0')
                    ,'i','1')
                ,'s','5')
            ,' ','')
        ) AS SUPPLIER_CONTACT_NUMBER2,
    supp_email,
    supp_address
from xxbcm_order_mgt;
