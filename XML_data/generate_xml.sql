CREATE TABLE xml_airplane(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE xml_airport(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE xml_carrier(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE xml_client(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE xml_country(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE xml_flight(
    id        NUMBER,
    xml_data  XMLTYPE
);
                       
CREATE TABLE xml_passenger(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE xml_payment(
    id        NUMBER,
    xml_data  XMLTYPE
);

CREATE TABLE clob_payment(
    id        NUMBER,
    xml_data  CLOB
);


CREATE TABLE xml_reservation(
    id        NUMBER,
    xml_data  XMLTYPE
);

@@generate_xml_1
@@generate_xml_2
@@generate_xml_3
@@generate_xml_4
@@generate_xml_5
@@generate_xml_6
@@generate_xml_7
@@generate_xml_8
@@generate_xml_9
