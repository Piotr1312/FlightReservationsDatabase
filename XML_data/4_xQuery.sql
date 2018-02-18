--xQuery
SET LONG 100000;
SELECT XMLQUERY('for $i in /flights/flight
                 where $i/ARRDATE > xs:date("2015-01-01")
                 and $i/ARRDATE < xs:date("2016-01-01")
                 return $i/ID'
PASSING XML_DATA RETURNING CONTENT) 
FROM XML_FLIGHT;

--SQL
SELECT ID
FROM Flight
WHERE ArrDate
    BETWEEN TO_DATE('01-01-2015', 'DD-MM-YYYY') AND TO_DATE('01-01-2016', 'DD-MM-YYYY');