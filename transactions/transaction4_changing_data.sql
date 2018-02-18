savepoint t4;

INSERT INTO Flight (CarrierID, AirplaneID, DepAirportID, DestAirportID, DepDate, ArrDate)
    VALUES (50, 50, 500, 350, TO_DATE('02-02-2016', 'DD-MM-YYYY'), TO_DATE('03-02-2016', 'DD-MM-YYYY'))
;
    
INSERT INTO Flight (CarrierID, AirplaneID, DepAirportID, DestAirportID, DepDate, ArrDate)
    VALUES (50, 34, 500, 234, TO_DATE('03-02-2016', 'DD-MM-YYYY'), TO_DATE('04-02-2016', 'DD-MM-YYYY'))
;

UPDATE Passenger
    SET LoyaltyPoints = LoyaltyPoints + 10,
        FavCarrierID = (SELECT ID
                        FROM (SELECT ID
                              FROM Carrier
                              ORDER BY Rating DESC
                              )
                        WHERE ROWNUM = 1
                        )
    WHERE Passenger.ID IN (SELECT PassengerID
                           FROM Reservation
                           WHERE Reservation.FlightID IN (SELECT ID
                                                          FROM Flight
                                                          WHERE Flight.DepDate
                                                              BETWEEN TO_DATE('01-01-2016', 'DD-MM-YYYY') AND TO_DATE('01-02-2016', 'DD-MM-YYYY')
                                                          )
                           )
;

UPDATE Reservation
    SET FlightID = (SELECT ID
                    FROM Flight
                    WHERE CarrierID = 50
                        AND AirplaneID = 50
                        AND DepAirportID = 500
                        AND DestAirportID = 350
                    )
    WHERE Reservation.FlightID IN (SELECT ID
                                   FROM Flight
                                   WHERE Flight.DepDate
                                       BETWEEN TO_DATE('01-01-2016', 'DD-MM-YYYY') AND TO_DATE('15-01-2016', 'DD-MM-YYYY')
                                   )
;

UPDATE Reservation
    SET FlightID = (SELECT ID
                    FROM Flight
                    WHERE CarrierID = 50
                        AND AirplaneID = 34
                        AND DepAirportID = 500
                        AND DestAirportID = 234
                    )
    WHERE Reservation.FlightID IN (SELECT ID
                                   FROM Flight
                                   WHERE Flight.DepDate
                                       BETWEEN TO_DATE('16-01-2016', 'DD-MM-YYYY') AND TO_DATE('01-02-2016', 'DD-MM-YYYY')
                                   )
;

DELETE FROM Flight
    WHERE Flight.DepDate
        BETWEEN TO_DATE('01-01-2016', 'DD-MM-YYYY') AND TO_DATE('01-02-2016', 'DD-MM-YYYY');
		
rollback to t4;
