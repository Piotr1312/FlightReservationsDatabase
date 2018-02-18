DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("flights",
          XMLAGG(
            XMLELEMENT("flight",
              XMLFOREST(
              f.ID AS "ID",
              f.CARRIERID AS "CARRIERID",
              f.AIRPLANEID AS "AIRPLANEID",
              f.DEPAIRPORTID AS "DEPAIRPORTID",
              f.DESTAIRPORTID AS "DESTAIRPORTID",
              f.DEPDATE AS "DEPDATE",
              f.ARRDATE AS "ARRDATE"
              )
            )
          )
        )
  INTO l_xmltype
  FROM flight f;
  
  INSERT INTO xml_flight VALUES (1,l_xmltype);
END;
/