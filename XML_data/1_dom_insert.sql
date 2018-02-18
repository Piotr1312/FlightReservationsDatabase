--DOM
set serveroutput on
DROP TABLE clob_flight;
CREATE TABLE clob_flight(
  id        NUMBER,
  xml_data  CLOB
);

declare
xmlDoc                xmldom.DOMDocument;
clobDoc               CLOB;
xmlElem               xmldom.DOMElement; 
vxml                  XMLTYPE;
nodeList              xmldom.DOMNode;
flightNodeList        xmldom.DOMNodeList;

FlightElement         xmldom.DOMElement;
IDElement             xmldom.DOMElement;
CarrierIDElement      xmldom.DOMElement;
AirplaneIDElement     xmldom.DOMElement;
DepAirportIDElement   xmldom.DOMElement;
DestAirportIDElement  xmldom.DOMElement;
DepDateElement        xmldom.DOMElement;
ArrDateElement        xmldom.DOMElement;

IDText                xmldom.DOMText;
CarrierIDText         xmldom.DOMText;
AirplaneIDText        xmldom.DOMText;
DepAirportIDText      xmldom.DOMText;
DestAirportIDText     xmldom.DOMText;
DepDateText           xmldom.DOMText;
ArrDateText           xmldom.DOMText;

FlightsNode           xmldom.DOMNode;
FlightNode            xmldom.DOMNode;
IDNode                xmldom.DOMNode;
CarrierIDNode         xmldom.DOMNode;
AirplaneIDNode        xmldom.DOMNode;
DepAirportIDNode      xmldom.DOMNode;
DestAirportIDNode     xmldom.DOMNode;
DepDateNode           xmldom.DOMNode;
ArrDateNode           xmldom.DOMNode;

begin
SELECT XML_DATA 
  INTO vxml
  FROM XML_FLIGHT
  WHERE ID=1;
xmlDoc:= dbms_xmldom.newDOMDocument(vxml);
xmlElem := xmldom.getDocumentElement(xmlDoc);
FlightsNode :=xmldom.makeNode(xmlElem);

FlightElement         	:= xmldom.createElement(xmlDoc,'flight');
FlightNode              :=xmldom.makeNode(FlightElement);

IDElement  				    := xmldom.createElement(xmlDoc,'ID' );
IDNode                :=xmldom.makeNode(IDElement);
CarrierIDElement  		:= xmldom.createElement(xmlDoc,'CARRIERID' );
CarrierIDNode				  :=xmldom.makeNode(CarrierIDElement);
AirplaneIDElement 		:= xmldom.createElement(xmlDoc, 'AIRPLANEID');
AirplaneIDNode			  :=xmldom.makeNode(AirplaneIDElement);
DepAirportIDElement  	:= xmldom.createElement(xmlDoc, 'DEPAIRPORTID' );
DepAirportIDNode 		  :=xmldom.makeNode(DepAirportIDElement);
DestAirportIDElement  := xmldom.createElement(xmlDoc,'DESTAIRPORTID' );
DestAirportIDNode		  :=xmldom.makeNode(DestAirportIDElement);
DepDateElement       	:= xmldom.createElement(xmlDoc, 'DEPDATE');
DepDateNode				    :=xmldom.makeNode(DepDateElement);
ArrDateElement        := xmldom.createElement(xmlDoc, 'ARRDATE' );
ArrDateNode				    :=xmldom.makeNode(ArrDateElement);

IDText 				        := xmldom.createTextNode(xmlDoc, '15000');
CarrierIDText         := xmldom.createTextNode(xmlDoc, '50');
AirplaneIDText        := xmldom.createTextNode(xmlDoc, '50');
DepAirportIDText      := xmldom.createTextNode(xmlDoc, '500');
DestAirportIDText     := xmldom.createTextNode(xmlDoc, '350');
DepDateText           := xmldom.createTextNode(xmlDoc, '02-02-2016');
ArrDateText           := xmldom.createTextNode(xmlDoc, '03-02-2016');

nodeList            :=xmldom.appendChild(IDNode,xmldom.makeNode(IDText));
nodeList			      :=xmldom.appendChild(CarrierIDNode,xmldom.makeNode(CarrierIDText));
nodeList			      :=xmldom.appendChild(AirplaneIDNode,xmldom.makeNode(AirplaneIDText));
nodeList		        :=xmldom.appendChild(DepAirportIDNode,xmldom.makeNode(DepAirportIDText));
nodeList		        :=xmldom.appendChild(DestAirportIDNode,xmldom.makeNode(DestAirportIDText));
nodeList				    :=xmldom.appendChild(DepDateNode,xmldom.makeNode(DepDateText));
nodeList				    :=xmldom.appendChild(ArrDateNode,xmldom.makeNode(ArrDateText));

nodeList            :=xmldom.appendChild(FlightNode, IDNode);
nodeList            :=xmldom.appendChild(FlightNode, IDNode);
nodeList            :=xmldom.appendChild(FlightNode, CarrierIDNode);
nodeList            :=xmldom.appendChild(FlightNode, AirplaneIDNode);
nodeList            :=xmldom.appendChild(FlightNode, DepAirportIDNode);
nodeList            :=xmldom.appendChild(FlightNode, DepDateNode);
nodeList            :=xmldom.appendChild(FlightNode, ArrDateNode);


nodeList   :=xmldom.appendChild(FlightsNode, FlightNode);

dbms_output.put_line(xmldom.getNodeName(FlightsNode));
dbms_output.put_line(xmldom.getNodeName(FlightNode));
flightNodeList := xmldom.getChildNodes(FlightNode);
for i in 0..xmldom.getLength(flightNodeList) - 1 loop
dbms_output.put_line(xmldom.getNodeName(xmldom.item(flightNodeList,i)));
dbms_output.put_line(xmldom.getNodeValue(xmldom.getFirstChild(xmldom.item(flightNodeList,i))));
end loop;
DBMS_LOB.CreateTemporary(clobDoc, TRUE);
dbms_xmldom.writeToClob(xmlDoc,clobDoc) ;
INSERT INTO clob_flight VALUES (1,clobDoc);
xmldom.freeDocument(xmlDoc);
end;

--SQL
INSERT INTO Flight (CarrierID, AirplaneID, DepAirportID, DestAirportID, DepDate, ArrDate)
    VALUES (50, 50, 500, 350, TO_DATE('02-02-2016', 'DD-MM-YYYY'), TO_DATE('03-02-2016', 'DD-MM-YYYY'))
;



