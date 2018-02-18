--b_tree_index
CREATE INDEX depDateIdx ON Flight(DepDate);

--bitmap_index
CREATE Bitmap INDEX AirBrIdx ON Airplane(Brand);

--composite_index
CREATE INDEX PaymentIdx ON Payment(ID, AmountPaid, isCardPayment);

CREATE TABLESPACE usb datafile 'D:\oradata\orcl\df1.dbf' SIZE 500m;

--patrition_by_range_on_Payment
ALTER TABLE Payment MODIFY
PARTITION BY RANGE (AmountPaid) (
    PARTITION Payment_2000 VALUES LESS THAN (2000),
    PARTITION Payment_4000 VALUES LESS THAN (4000),
    PARTITION Payment_6000 VALUES LESS THAN (6000),
    PARTITION Payment_inf VALUES LESS THAN (MAXVALUE)
) ONLINE;

ALTER TABLE Payment move PARTITION Payment_6000 TABLESPACE usb ONLINE;
ALTER TABLE Payment move PARTITION Payment_inf TABLESPACE usb ONLINE;

--partition_by_hash_on_Passenger
ALTER TABLE Passenger MODIFY
PARTITION BY Hash (FlightsNo) (
    PARTITION Passenger_1 TABLESPACE USERS,
    PARTITION Passenger_2 TABLESPACE USERS
) ONLINE;

ALTER TABLE Passenger move PARTITION Passenger_1 TABLESPACE usb ONLINE;
