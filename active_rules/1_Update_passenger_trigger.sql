CREATE OR REPLACE TRIGGER on_reservation
  AFTER INSERT ON Reservation
  FOR EACH ROW
DECLARE
PASSENGER_ID NUMBER;
BEGIN
  SELECT Passenger.ID
    INTO Passenger_ID
    FROM Passenger
   WHERE Passenger.ID = :NEW.PassengerID;
   UPDATE PASSENGER 
   SET LoyaltyPoints = LoyaltyPoints+10,
   FlightsNo = FlightsNo+1;
  end;
/