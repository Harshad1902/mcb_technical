CREATE TABLE INVOICE_DETAILS (
    INVOICE_DETAILS_ID          NUMBER          GENERATED BY DEFAULT ON NULL AS IDENTITY,
    INVOICE_DETAILS_INVOICE_ID  NUMBER          NOT NULL,
    INVOICE_DETAILS_ORDER_DETAILS_ID    NUMBER  NOT NULL,
    INVOICE_STATUS              VARCHAR2(20),
    INVOICE_HOLD_REASON         VARCHAR2(50),
    INVOICE_DESCRIPTION         VARCHAR2(200),
    INVOICE_AMOUNT              DECIMAL(38,2),
    CONSTRAINT INVOICE_DETAILS_PK PRIMARY KEY (INVOICE_DETAILS_ID),
    CONSTRAINT INVOICE_DETAILS_FK FOREIGN KEY (INVOICE_DETAILS_INVOICE_ID) REFERENCES INVOICE(INVOICE_ID),
    CONSTRAINT INVOICE_DETAILS_ORDER_FK FOREIGN KEY (INVOICE_DETAILS_ORDER_DETAILS_ID) REFERENCES ORDER_DETAILS(ORDER_DETAILS_ID)
);
/