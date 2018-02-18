DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("airports",
          XMLAGG(
            XMLELEMENT("airport",
              XMLFOREST(
              a.ID AS "ID",
              a.COUNTRYID AS "COUNTRYID",
              a.NAME AS "NAME",
              a.CITY AS "CITY"
              )
            )
          )
        )
  INTO l_xmltype
  FROM airport a;
  
  INSERT INTO xml_airport VALUES (1,l_xmltype);
END;
/