--DOM
set serveroutput on
declare
xmlDoc xmldom.DOMDocument; 
xmlElem xmldom.DOMElement; 
airplaneNode xmldom.DOMNode;
airplaneNodeList xmldom.DOMNodeList; 
innerNode xmldom.DOMNode; 
innerNodeList xmldom.DOMNodeList;
vxml      XMLTYPE;
begin
SELECT XML_DATA 
  INTO vxml
  FROM XML_AIRPLANE 
  WHERE ID=1;
xmlDoc:= dbms_xmldom.newDOMDocument(vxml);
xmlElem := xmldom.getDocumentElement(xmlDoc);
airplaneNodeList := xmldom.getChildNodes(xmldom.makeNode(xmlElem));
for i in 0..xmldom.getLength(airplaneNodeList) - 1 loop
airplaneNode := xmldom.item(airplaneNodeList, i);
innerNodeList := xmldom.getChildNodes(airplaneNode);
for j in 0..xmldom.getLength(innerNodeList) - 1 loop
innerNode := xmldom.item(innerNodeList, j);
if (xmldom.getNodeName(innerNode) = 'BRAND') then
if (xmldom.getNodeValue(xmldom.getFirstChild(innerNode)) = 'Mercedes-Benz') then
dbms_output.put_line(xmldom.getNodeValue(xmldom.getFirstChild(xmldom.getPreviousSibling(innerNode))));
end if;
end if;
end loop;
end loop;
xmldom.freeDocument(xmlDoc);
end;

--SQL
SELECT ID
FROM AIRPLANE
WHERE Brand = 'Mercedes-Benz';