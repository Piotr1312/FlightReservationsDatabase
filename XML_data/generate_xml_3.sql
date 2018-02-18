DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("carriers",
          XMLAGG(
            XMLELEMENT("carrier",
              XMLFOREST(
              a.ID AS "ID",
              a.NAME AS "NAME",
              a.RATING AS "RATING"
              )
            )
          )
        )
  INTO l_xmltype
  FROM carrier a;
  
  INSERT INTO xml_carrier VALUES (1,l_xmltype);
END;
/