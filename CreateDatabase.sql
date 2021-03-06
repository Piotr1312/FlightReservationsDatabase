CREATE TABLE Payment (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    AmountPaid NUMBER(12,2) CONSTRAINT AmountPaidReq NOT NULL,
    PaymentDate DATE CONSTRAINT PaymentDateReq NOT NULL,
    IsCardPayment NUMBER(1) CONSTRAINT IsCardPaymentReq NOT NULL,
    
    CONSTRAINT PKID PRIMARY KEY (ID)
);

CREATE TABLE Country (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR2(50) CONSTRAINT NameReqC UNIQUE NOT NULL,
    
    CONSTRAINT PKIDCountry PRIMARY KEY (ID)
);

CREATE TABLE Airport (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    CountryID NUMBER(10) CONSTRAINT CountryIDReqA NOT NULL,
    Name VARCHAR2(50) CONSTRAINT NameReqA NOT NULL,
    City VARCHAR2(50) CONSTRAINT CityReqA NOT NULL,
    
    CONSTRAINT PKIDA PRIMARY KEY (ID),
    CONSTRAINT FKCountryIDA FOREIGN KEY (CountryID) 
      REFERENCES Country
);

CREATE TABLE Carrier (
    ID NUMBER (10) GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR2(50) CONSTRAINT NameReqCar NOT NULL,
    Rating NUMBER (3) CONSTRAINT RatingReqCar NOT NULL,
    
    CONSTRAINT PKIDCar PRIMARY KEY (ID)
);

 CREATE TABLE Airplane (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    Brand VARCHAR2(50) CONSTRAINT BrandReq NOT NULL,
    Model VARCHAR2(50),
    SeatsNo NUMBER(3) CONSTRAINT SeatsNoReq NOT NULL,
    
    CONSTRAINT PKIDAirpl PRIMARY KEY (ID)
);
    
CREATE TABLE Client (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    CountryID NUMBER(10) CONSTRAINT CountryIDReqCl NOT NULL,
    FirstName VARCHAR2(50) CONSTRAINT FirstNameReqCl NOT NULL,
    LastName VARCHAR2(50) CONSTRAINT LastNameReqCl NOT NULL,
    City VARCHAR2(50) CONSTRAINT CityReqCl NOT NULL,
    Street VARCHAR2(50) CONSTRAINT StreetReqCl NOT NULL,
    HouseNo NUMBER(10) CONSTRAINT HouseNoReqCL NOT NULL,
    FlatNo NUMBER(5),
    TelNumber VARCHAR2(20),
    Email VARCHAR2(50),
    
    CONSTRAINT PKIDCl PRIMARY KEY (ID),
    CONSTRAINT FKCountryIDCl FOREIGN KEY (CountryID)
        REFERENCES Country
);

CREATE TABLE Passenger (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    ClientID NUMBER(10) CONSTRAINT ClientIDReqPas NOT NULL,
    FavCarrierID NUMBER(10) CONSTRAINT FavCarrierIDReqPas NOT NULL,
    LoyaltyPoints NUMBER(10),
    FlightsNo NUMBER(10),
    
    CONSTRAINT PKIDPas PRIMARY KEY (ID),
    CONSTRAINT FKClientIDPas FOREIGN KEY (ClientID)
        REFERENCES Client,
    CONSTRAINT FKFavCarrierIDPas FOREIGN KEY (FavCarrierID)
        REFERENCES Carrier
);

CREATE TABLE Flight (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    CarrierID NUMBER(10) CONSTRAINT CarrierIDReqFl NOT NULL,
    AirplaneID NUMBER(10) CONSTRAINT AirplaneIDREqFl NOT NULL,
    DepAirportID NUMBER(10) CONSTRAINT DepAirportIDReqFl NOT NULL,
    DestAirportID NUMBER(10) CONSTRAINT DestAirportIDFl NOT NULL,
    DepDate DATE CONSTRAINT DepDateReqFl NOT NULL,
    ArrDate DATE CONSTRAINT ArrDateReqFl NOT NULL,
    
    CONSTRAINT PKIDFl PRIMARY KEY (ID),
    CONSTRAINT FKCarrierIDFl FOREIGN KEY (CarrierID)
      REFERENCES Carrier,
    CONSTRAINT FKAirplaneIDFl FOREIGN KEY (AirplaneID)
      REFERENCES Airplane,
    CONSTRAINT FKDepAirportIDFl FOREIGN KEY (DepAirportID)
      REFERENCES Airport,
    CONSTRAINT FKDestAirportIDFl FOREIGN KEY (DestAirportID)
      REFERENCES Airport
);

CREATE TABLE Reservation (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    FlightID NUMBER(10) CONSTRAINT FlightIDReqRes NOT NULL,
    PassengerID NUMBER(10) CONSTRAINT PassengerIDReqRes NOT NULL,
    PaymentID NUMBER(10) CONSTRAINT PaymentIDReqRes NOT NULL,
    SeatNo NUMBER(3) CONSTRAINT SeatNoReqRes NOT NULL,
    
    CONSTRAINT PKIDRes PRIMARY KEY (ID),
    CONSTRAINT FKFlightIDRes FOREIGN KEY (FlightID)
        REFERENCES Flight,
    CONSTRAINT FKPassengerIDRes FOREIGN KEY (PassengerID)
        REFERENCES Passenger,
    CONSTRAINT FKPaymentIDRes FOREIGN KEY (PaymentID)
        REFERENCES Payment
);
