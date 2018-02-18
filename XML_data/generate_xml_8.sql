DECLARE
  l_xmltype XMLTYPE;
  l_clob CLOB;
  
BEGIN
  SELECT XMLELEMENT("payments",
          XMLAGG(
            XMLELEMENT("payment",
              XMLFOREST(
              p.ID AS "ID",
              p.AMOUNTPAID AS "AMOUNTPAID",
              p.PAYMENTDATE AS "PAYMENTDATE",
              p.ISCARDPAYMENT AS "ISCARDPAYMENT"
              )
            )
          )
        )
  INTO l_xmltype
  FROM payment p;
  
  
  SELECT XMLELEMENT("payments",
          XMLAGG(
            XMLELEMENT("payment",
              XMLFOREST(
              p.ID AS "ID",
              p.AMOUNTPAID AS "AMOUNTPAID",
              p.PAYMENTDATE AS "PAYMENTDATE",
              p.ISCARDPAYMENT AS "ISCARDPAYMENT"
              )
            )
          )
        ).getclobval()
  INTO l_clob
  FROM payment p;
  
  INSERT INTO xml_payment VALUES (1,l_xmltype);
  INSERT INTO clob_payment VALUES (1,l_clob);
END;
/