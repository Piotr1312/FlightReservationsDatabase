CREATE TABLE Log (
    TriggerOnReservation VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER on_reservation_1
AFTER INSERT OR UPDATE ON Reservation
FOR EACH ROW
BEGIN
    INSERT INTO Log (TriggerOnReservation) VALUES ('on_reservation_1');
END;
/

CREATE OR REPLACE TRIGGER on_reservation_2
AFTER INSERT OR UPDATE ON Reservation
FOR EACH ROW
FOLLOWS on_reservation_1
BEGIN
    INSERT INTO Log (TriggerOnReservation) VALUES ('on_reservation_2');
END;
/

CREATE OR REPLACE TRIGGER on_reservation_3
AFTER INSERT OR UPDATE ON Reservation
FOR EACH ROW
FOLLOWS on_reservation_2
BEGIN
    INSERT INTO Log (TriggerOnReservation) VALUES ('on_reservation_3');
END;
/