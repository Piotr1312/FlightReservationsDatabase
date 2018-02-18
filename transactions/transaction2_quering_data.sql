SELECT 'Card' AS PaymentMethod, SUM(AmountPaid) AS TotalAmountPaid, COUNT(*) AS NumberOfPayments, SUM(AmountPaid) / COUNT(*) AS Average
    FROM Payment
    WHERE Payment.ID IN (SELECT Payment.ID
                         FROM Payment, Airplane, Reservation, Flight
                         WHERE Payment.IsCardPayment = 1
                             AND Payment.ID = Reservation.PaymentID
                             AND Reservation.FlightID = Flight.ID
                             AND Flight.AirplaneID = Airplane.ID
                             AND Airplane.ID IN (SELECT ID
                                                 FROM Airplane
                                                 WHERE Brand = 'Audi' OR Brand = 'BMW'
                                                )
                             AND Flight.ID IN (SELECT ID
                                               FROM Flight
                                               WHERE ArrDate
                                                   BETWEEN TO_DATE('01-01-2015', 'DD-MM-YYYY') AND TO_DATE('01-01-2016', 'DD-MM-YYYY')
                                               )
                        )

UNION ALL

SELECT 'Cash' AS PaymentMethod, SUM(AmountPaid) AS TotalAmountPaid, COUNT(*) AS NumberOfPayments, SUM(AmountPaid) / COUNT(*) AS Average 
    FROM Payment
    WHERE Payment.ID IN (SELECT Payment.ID
                         FROM Payment, Airplane, Reservation, Flight
                         WHERE Payment.IsCardPayment = 0
                             AND Payment.ID = Reservation.PaymentID
                             AND Reservation.FlightID = Flight.ID
                             AND Flight.AirplaneID = Airplane.ID
                             AND Airplane.ID IN (SELECT ID
                                                 FROM Airplane
                                                 WHERE Brand = 'Audi' OR Brand = 'BMW'
                                                )
                             AND Flight.ID IN (SELECT ID
                                               FROM Flight
                                               WHERE ArrDate
                                                   BETWEEN TO_DATE('01-01-2015', 'DD-MM-YYYY') AND TO_DATE('01-01-2016', 'DD-MM-YYYY')
                                               )
                        )
;