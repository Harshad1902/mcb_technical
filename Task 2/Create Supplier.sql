CREATE TABLE SUPPLIER (
    SUPPLIER_ID                 NUMBER          GENERATED BY DEFAULT ON NULL AS IDENTITY,
    SUPPLIER_NAME               VARCHAR2(100)   NOT NULL,
    SUPPLIER_CONTACT_NAME       VARCHAR2(100)   NOT NULL,
    SUPPLIER_CONTACT_NUMBER1    VARCHAR2(25),
    SUPPLIER_CONTACT_NUMBER2    VARCHAR2(25),
    SUPPLIER_EMAIL              VARCHAR2(75),
    SUPPLIER_ADDRESS            VARCHAR2(200),
    CONSTRAINT SUPPLIER_PK PRIMARY KEY (SUPPLIER_ID)
);
/
