SELECT FirstName, LastName, TelNumber
FROM Country, Client, Passenger, Reservation
WHERE CountryID IN (SELECT ID
                    FROM Country
                    WHERE Country.Name IN (SELECT Country.Name
                                           FROM Country, Client, Passenger, Reservation
                                           WHERE Country.ID = Client.CountryID
                                               AND Client.ID = Passenger.ClientID
                                               AND Passenger.ID = Reservation.PassengerID
                                               AND Reservation.PaymentID IN (SELECT ID
                                                                             FROM Payment
                                                                             WHERE IsCardPayment = 1
                                                                                 AND AmountPaid > 6000
                                                                            )
                                               AND Passenger.FlightsNo > 4
                                           GROUP BY Country.Name
                                           ORDER BY COUNT(*) DESC
                                           FETCH FIRST 1 ROW ONLY
                                           )
                    )
    AND Country.ID = Client.CountryID
    AND Client.ID = Passenger.ClientID
    AND Passenger.ID = Reservation.PassengerID
    AND Reservation.PaymentID IN (SELECT ID
                                  FROM Payment
                                  WHERE IsCardPayment = 1
                                  AND AmountPaid > 6000
                                  )
    AND Passenger.FlightsNo > 4
;