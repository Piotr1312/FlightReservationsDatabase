--updateXML and xPath
UPDATE XML_AIRPLANE 
SET XML_DATA = updateXML(XML_DATA, '//airplanes/airplane[BRAND="Fiat" or BRAND="Opel" or BRAND="Ford" or BRAND="Citroen" or BRAND="Renault"]/BRAND/text()', 'Mercedes');
 
UPDATE XML_AIRPLANE 
SET XML_DATA = updateXML(XML_DATA, '//airplanes/airplane[BRAND="Mercedes"]/MODEL/text()', 'CLS',
                                   '//airplanes/airplane[BRAND="Mercedes"]/SEATSNO/text()', 200);

--SQL	
UPDATE Airplane
    SET Brand = 'Mercedes',
        Model = 'CLS',
        SeatsNo = 200
    WHERE Brand = 'Fiat' OR Brand = 'Opel' OR Brand = 'Ford' OR Brand = 'Citroen' OR Brand = 'Renault'
;