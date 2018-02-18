SELECT FirstName, LastName, Country.Name AS Country, Carrier.Name AS FavouriteCarrier
    FROM Client, Passenger, Reservation, Carrier, Flight, Airport, Country
    WHERE FlightID IN (SELECT Flight.ID
                       FROM Flight
                       WHERE DepDate
                           BETWEEN TO_DATE('01-01-2014', 'DD-MM-YYYY') AND TO_DATE('01-01-2017', 'DD-MM-YYYY')
                       )
        AND Client.ID = Passenger.ClientID
        AND Passenger.ID = Reservation.PassengerID
        AND Passenger.FavCarrierID = Carrier.ID
        AND Reservation.FlightID = Flight.ID
        AND Flight.DepAirportID = Airport.ID
        AND Airport.CountryID = Country.ID
        AND Country.ID IN (SELECT ID FROM Country
                           WHERE Name = 'Germany' OR Name = 'France'
                           )
        AND PassengerID IN (SELECT PassengerID
                            FROM Reservation
                            WHERE FlightID IN (SELECT Flight.ID
                                               FROM Flight
                                               WHERE DepDate
                                                   BETWEEN TO_DATE('01-01-2014', 'DD-MM-YYYY') AND TO_DATE('01-01-2017', 'DD-MM-YYYY')
                                               )
                            GROUP BY PassengerID
                            HAVING COUNT(*) > 2
                            )
    ORDER BY Country
;