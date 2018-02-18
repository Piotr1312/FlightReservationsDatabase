DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("passengers",
          XMLAGG(
            XMLELEMENT("passenger",
              XMLFOREST(
              p.ID AS "ID",
              p.CLIENTID AS "CLIENTID",
              p.FAVCARRIERID AS "FAVCARRIERID",
              p.LOYALTYPOINTS AS "LOYALTYPOINTS",
              p.FLIGHTSNO AS "FLIGHTSNO"
              )
            )
          )
        )
  INTO l_xmltype
  FROM passenger p;
  
  INSERT INTO xml_passenger VALUES (1,l_xmltype);
END;
/