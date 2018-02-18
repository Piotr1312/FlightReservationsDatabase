ALTER TABLE Carrier
    ADD (CONSTRAINT check_rating CHECK (Rating <= 100));
/
