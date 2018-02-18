--xQuery
SET LONG 10000000;
SELECT XMLQUERY('for $i in /payments/payment
                 where $i/AMOUNTPAID > 6000
                 and $i/ISCARDPAYMENT = 1
                 return $i/ID'
PASSING XML_DATA RETURNING CONTENT) 
FROM XML_PAYMENT;

--SQL
SELECT ID
FROM Payment
WHERE IsCardPayment = 1
    AND AmountPaid > 6000;