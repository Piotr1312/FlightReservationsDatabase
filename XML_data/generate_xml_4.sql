DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("clients",
          XMLAGG(
            XMLELEMENT("client",
              XMLFOREST(
              c.ID AS "ID",
              c.COUNTRYID AS "COUNTRYID",
              c.FIRSTNAME AS "FIRSTNAME",
              c.LASTNAME AS "LASTNAME",
              c.CITY AS "CITY",
              c.STREET AS "STREET",
              c.HOUSENO AS "HOUSENO",
              c.FLATNO AS "FLATNO",
              c.TELNUMBER AS "TELNUMBER",
              c.EMAIL AS "EMAIL"
              )
            )
          )
        )
  INTO l_xmltype
  FROM client c;
  
  INSERT INTO xml_client VALUES (1,l_xmltype);
END;
/