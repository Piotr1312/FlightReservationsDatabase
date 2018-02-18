DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("airplanes",
          XMLAGG(
            XMLELEMENT("airplane",
              XMLFOREST(
              a.ID AS "ID",
              a.BRAND AS "BRAND",
              a.MODEL AS "MODEL",
              a.SEATSNO AS "SEATSNO"
              )
            )
          )
        )
  INTO l_xmltype
  FROM airplane a;
  
  INSERT INTO xml_airplane VALUES (1,l_xmltype);
END;
/