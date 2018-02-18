DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("countries",
          XMLAGG(
            XMLELEMENT("country",
              XMLFOREST(
              c.ID AS "ID",
              c.NAME AS "NAME"
              )
            )
          )
        )
  INTO l_xmltype
  FROM country c;
  
  INSERT INTO xml_country VALUES (1,l_xmltype);
END;
/