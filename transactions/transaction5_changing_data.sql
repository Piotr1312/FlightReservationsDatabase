savepoint t5;

UPDATE Airplane
    SET Brand = 'Mercedes',
        Model = 'CLS',
        SeatsNo = 200
    WHERE Brand = 'Fiat' OR Brand = 'Opel' OR Brand = 'Ford' OR Brand = 'Citroen' OR Brand = 'Renault'
;

DELETE FROM Airplane
    WHERE ID NOT IN (SELECT AirplaneID
                     FROM Flight
                    )
        AND (Brand = 'Nissan' OR Brand = 'Toyota')
;

UPDATE Carrier
    SET Rating = Rating + 10
    WHERE Rating < 90
    AND ID IN (SELECT CarrierID
               FROM Flight
               WHERE AirplaneID IN (SELECT ID
                                    FROM AIRPLANE
                                    WHERE Brand = 'Mercedes'
                                    )
               )
;

UPDATE Carrier
    SET Rating = Rating - 10
    WHERE Rating > 10
    AND ID IN (SELECT CarrierID
               FROM Flight
               WHERE AirplaneID IN (SELECT ID
                                    FROM AIRPLANE
                                    WHERE Brand = 'Nissan' OR Brand = 'Toyota'
                                    )
               )
;

UPDATE Passenger
    SET LoyaltyPoints = LoyaltyPoints + 10
    WHERE ID IN (SELECT PassengerID
                 FROM Reservation
                 WHERE FlightID IN (SELECT ID
                                    FROM Flight
                                    WHERE AirplaneID IN (SELECT ID
                                                         FROM Airplane
                                                         WHERE Brand = 'Nissan' OR Brand = 'Toyota'
                                                        )
                                    )
                )
;

rollback to t5;