DECLARE
  l_xmltype XMLTYPE;
  
BEGIN
  SELECT XMLELEMENT("reservations",
          XMLAGG(
            XMLELEMENT("reservation",
              XMLFOREST(
              r.ID AS "ID",
              r.FLIGHTID AS "FLIGHTID",
              r.PASSENGERID AS "PASSENGERID",
              r.PAYMENTID AS "PAYMENTID",
              r.SEATNO AS "SEATNO"
              )
            )
          )
        )
  INTO l_xmltype
  FROM reservation r;
  
  INSERT INTO xml_reservation VALUES (1,l_xmltype);
END;