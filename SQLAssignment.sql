--Creating Company Table
CREATE TABLE Company 
    (
     CompID INTEGER NOT NULL ,
	 CompNAME VARCHAR (60) NOT NULL ,  
     EmpID INTEGER NOT NULL , 
     TFcharge INTEGER NOT NULL , 
     Taxi_Firm_CompID INTEGER  ,   
    )
GO

ALTER TABLE Company ADD CONSTRAINT Company_PK PRIMARY KEY CLUSTERED (CompID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

alter table [dbo].[Company]
drop constraint [Company_Taxi_Firm_FK]

--Creating Customer Table
CREATE TABLE Customer 
    (
     CustID INTEGER NOT NULL , 
     CustNAME VARCHAR (60) NOT NULL , 
     CustPHONE INTEGER NOT NULL , 
     CustADD VARCHAR (60) NOT NULL , 
     Customer_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Taxi_Firm_CompID INTEGER  , 
     CompID INTEGER  
    )
GO

ALTER TABLE Customer ADD CONSTRAINT Customer_PK PRIMARY KEY CLUSTERED (Customer_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE Customer ADD CONSTRAINT Customer_CustID_UN UNIQUE NONCLUSTERED (CustID)
GO

--Relation
CREATE TABLE drive 
    (
     Taxi_Car_EmpID INTEGER  , 
     Customer_Customer_ID NUMERIC (28)
    )
GO

ALTER TABLE drive ADD CONSTRAINT drive_PK PRIMARY KEY CLUSTERED (Taxi_Car_EmpID, Customer_Customer_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Employee 
    (
     EmpID INTEGER NOT NULL , 
     EmpADD VARCHAR (60) NOT NULL , 
     EmpNAME VARCHAR (60) NOT NULL , 
     EmpPHONE INTEGER NOT NULL , 
     EmpEMAIL VARCHAR (60) NOT NULL , 
     Epay INTEGER NOT NULL , 
     Estartdate DATE NOT NULL , 
     Taxi_Firm_CompID INTEGER , 
     
    )
GO

ALTER TABLE Employee ADD CONSTRAINT Employee_PK PRIMARY KEY CLUSTERED (EmpID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE places 
    (
     Taxi_Car_EmpID INTEGER NOT NULL , 
     Taxi_Journey_TaxiREG VARCHAR  , 
     Taxi_Journey_TaxiREG1 VARCHAR (60)  
    )
GO

ALTER TABLE places ADD CONSTRAINT places_PK PRIMARY KEY CLUSTERED (Taxi_Car_EmpID, Taxi_Journey_TaxiREG, Taxi_Journey_TaxiREG1)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Taxi_Car 
    (
     EmpID INTEGER NOT NULL , 
     TaxiREG VARCHAR (60) NOT NULL , 
     CustID INTEGER NOT NULL 
    )
GO

ALTER TABLE Taxi_Car ADD CONSTRAINT Taxi_Car_PK PRIMARY KEY CLUSTERED (EmpID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Taxi_Firm 
    (
     CompID INTEGER NOT NULL , 
     EmpID INTEGER NOT NULL , 
     CustID INTEGER NOT NULL , 
     FirmID INTEGER NOT NULL , 
     FirmNAME VARCHAR (60) NOT NULL 
    )
GO

ALTER TABLE Taxi_Firm ADD CONSTRAINT Taxi_Firm_PK PRIMARY KEY CLUSTERED (CompID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Taxi_Journey 
    (
     TaxiREG VARCHAR (60) NOT NULL , 
     JTIME TIME , 
     JORIGIN VARCHAR (60) NOT NULL , 
     JDESTINATION VARCHAR (60) NOT NULL , 
     JDATE DATE NOT NULL 
    )
GO

ALTER TABLE Taxi_Journey ADD CONSTRAINT Taxi_Journey_PK PRIMARY KEY CLUSTERED (TaxiREG)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Company 
    ADD CONSTRAINT Company_Taxi_Firm_FK FOREIGN KEY 
    ( 
     Taxi_Firm_CompID
    ) 
    REFERENCES Taxi_Firm 
    ( 
     CompID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Customer 
    ADD CONSTRAINT Customer_Taxi_Firm_FK FOREIGN KEY 
    ( 
     Taxi_Firm_CompID
    ) 
    REFERENCES Taxi_Firm 
    ( 
     CompID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

alter table [dbo].[Customer]
drop constraint [Customer_Taxi_Firm_FK]

ALTER TABLE drive 
    ADD CONSTRAINT drive_Customer_FK FOREIGN KEY 
    ( 
     Customer_Customer_ID
    ) 
    REFERENCES Customer 
    ( 
     Customer_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE drive 
    ADD CONSTRAINT drive_Taxi_Car_FK FOREIGN KEY 
    ( 
     Taxi_Car_EmpID
    ) 
    REFERENCES Taxi_Car 
    ( 
     EmpID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Employee 
    ADD CONSTRAINT Employee_Taxi_Firm_FK FOREIGN KEY 
    ( 
     Taxi_Firm_CompID
    ) 
    REFERENCES Taxi_Firm 
    ( 
     CompID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE places 
    ADD CONSTRAINT places_Taxi_Car_FK FOREIGN KEY 
    ( 
     Taxi_Car_EmpID
    ) 
    REFERENCES Taxi_Car 
    ( 
     EmpID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

alter table [dbo].[Employee]
drop constraint [Employee_Taxi_Firm_FK]

ALTER TABLE places 
    ADD CONSTRAINT places_Taxi_Journey_FK FOREIGN KEY 
    ( 
     Taxi_Journey_TaxiREG1
    ) 
    REFERENCES Taxi_Journey 
    ( 
     TaxiREG 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



--------------------------------------------------------------------------------------------

--INSERT INTO TAXI_FIRM TABLE
INSERT INTO Taxi_Firm(CompID, EmpID, CustID, FirmID, FirmNAME )
VALUES ('11923', '1872','43331', '2020','Emmanuel');

INSERT INTO Taxi_Firm(CompID, EmpID, CustID, FirmID, FirmNAME )
VALUES ('37726', '2332','27319', '2020','Emmanuel');

INSERT INTO Taxi_Firm(CompID, EmpID, CustID, FirmID, FirmNAME )
VALUES ('31322', '6321','46132', '2020','Emmanuel');

INSERT INTO Taxi_Firm(CompID, EmpID, CustID, FirmID, FirmNAME )
VALUES ('28317', '3213','39213', '2020','Emmanuel');



--INSERT INTO CUSTOMER TABLE
INSERT INTO Customer(CustID, CustNAME, CustPHONE, CustADD, CompID, Taxi_Firm_CompID)
VALUES ('12313', 'Jonathan','087336251', '54 Barcaly Road', '12223', '21212');

INSERT INTO Customer(CustID, CustNAME, CustPHONE, CustADD, CompID, Taxi_Firm_CompID)
VALUES ('37231', 'Richard','087436251', '52 Slehind', '42784', '24321');

INSERT INTO Customer(CustID, CustNAME, CustPHONE, CustADD, CompID, Taxi_Firm_CompID)
VALUES ('32849', 'Seamus','08993624', '34 Rossfield Road', '36623', '08342');

INSERT INTO Customer(CustID, CustNAME, CustPHONE, CustADD, CompID, Taxi_Firm_CompID)
VALUES ('39131', 'Victor','087333251', '12 Sunshine Road', '92934', '20321');


--INSERT INTO TAXI_CAR TABLE
INSERT INTO Taxi_Car(EmpID, TaxiREG, CustID)
VALUES ('36219', '08731321G', '372891');

INSERT INTO Taxi_Car(EmpID, TaxiREG, CustID)
VALUES ('83182', '43274321B', '371891');

INSERT INTO Taxi_Car(EmpID, TaxiREG, CustID)
VALUES ('36219' ,'08731239Z', '785423');

INSERT INTO Taxi_Car(EmpID, TaxiREG, CustID)
VALUES ('76432', '38913901R', '674452');


--INSERT INTO TAXI_JOURNEY TABLE
INSERT INTO Taxi_Journey(TaxiREG, JDESTINATION, JORIGIN, JTIME, JDATE)
VALUES ('18028390T', 'Portsmouth', 'Riverdale', '11:04:11', '2022-04-11');

INSERT INTO Taxi_Journey(TaxiREG, JDESTINATION, JORIGIN, JTIME, JDATE)
VALUES ('38372910Y', 'MacUllaim', 'Square', '22:04:31', '2022-07-13');

INSERT INTO Taxi_Journey(TaxiREG, JDESTINATION, JORIGIN, JTIME, JDATE)
VALUES ('02749238O', 'Rossfield', 'Morthend', '02:11:17', '2022-11-04');

INSERT INTO Taxi_Journey(TaxiREG, JDESTINATION, JORIGIN, JTIME, JDATE)
VALUES ('02749258J', 'Tallaght', 'Firhouse', '09:10:17', '2022-10-02');


--INSERT INTO EMPLOYEE TABLE
INSERT INTO Employee(EmpID, EmpADD, EmpEMAIL,  EmpNAME, EmpPHONE, Epay, Estartdate, Taxi_Firm_CompID)
VALUES ('27618', '32 Tallaght Road', 'johnoneill@gmail.com', 'John', '082782361','28000','2022-11-02','28321');

INSERT INTO Employee(EmpID, EmpADD, EmpEMAIL,  EmpNAME, EmpPHONE, Epay, Estartdate, Taxi_Firm_CompID)
VALUES ('29371', '25 Oldbawn Avenue', 'peter321@gmail.com', 'Peter', '087021361','028322','2022-02-11','72913');

INSERT INTO Employee(EmpID, EmpADD, EmpEMAIL,  EmpNAME, EmpPHONE, Epay, Estartdate, Taxi_Firm_CompID)
VALUES ('02741', '1 Glenshane View', 'sarahcollins@gmail.com', 'Sarah', '082345100','028123','2022-01-29','28321');

INSERT INTO Employee(EmpID, EmpADD, EmpEMAIL,  EmpNAME, EmpPHONE, Epay, Estartdate, Taxi_Firm_CompID)
VALUES ('05830', '32 Tallaght Road', 'amyrehind@gmail.com', 'Amy', '0892133812','028312','2022-01-22','92109');

--INSERT INTO COMPANY TABLE
INSERT INTO Company(CompNAME, CompID, EmpID, TFcharge, Taxi_Firm_CompID)
VALUES ('TORONTO FLIES', '072813', '02921','6000','038218')

INSERT INTO Company(CompNAME, CompID, EmpID, TFcharge, Taxi_Firm_CompID)
VALUES ('TENNISERS', '927812', '82071','3000','329133')

INSERT INTO Company(CompNAME, CompID, EmpID, TFcharge, Taxi_Firm_CompID)
VALUES ('PLAYZCUTZ', '649291', '23873','2700','302081')

INSERT INTO Company(CompNAME, CompID, EmpID, TFcharge, Taxi_Firm_CompID)
VALUES ('RUGGER', '28317', '29138','9000','381913')



--Select Statement 
select * from Customer
select * from Taxi_Firm
select * from Taxi_Car
select * from Taxi_Journey
select * from Employee
select * from Company


--UNION
SELECT EmpNAME FROM Employee
UNION
SELECT TaxiREG FROM Taxi_Car;


--INTERSECT
SELECT CompID FROM Company
WHERE CompID < 30000
INTERSECT
SELECT CompID FROM Taxi_Firm
WHERE CompID < 30000


--EXCEPT
SELECT CompNAME FROM Company
EXCEPT
SELECT CustADD FROM Customer;


--JOINS(INNER)
SELECT Company.CompID, Taxi_Firm.CompID FROM Company
INNER JOIN Taxi_Firm ON Company.CompID = Taxi_Firm.CompID;


--JOINS(OUTER)
SELECT Taxi_Firm.CompID, Company.CompID FROM Taxi_Firm
FULL OUTER JOIN Company ON Taxi_Firm.CompID=Company.CompID
ORDER BY Taxi_Firm.CompID;


--SUBQUERY
SELECT TFcharge  FROM  Company 
WHERE  TFcharge > 5000
   (SELECT Epay FROM Employee 
	WHERE Epay > 5000)


--Aggregation
SELECT CustPHONE FROM Customer
WHERE upper(CustPhone) LIKE '8%'
GROUP BY CustPHONE
