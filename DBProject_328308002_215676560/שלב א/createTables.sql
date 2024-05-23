CREATE TABLE Stores (
  Store_ID INT NOT NULL,
  Base VARCHAR2(40) NOT NULL,
  Capacity INT NOT NULL,
  PRIMARY KEY (Store_ID)
);

CREATE TABLE Item (
  Serial_Number INT NOT NULL,
  Manufact_Date DATE NOT NULL,
  Price FLOAT NOT NULL,
  Store_ID INT NOT NULL,
  PRIMARY KEY (Serial_Number),
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

CREATE TABLE Soldier (
  Soldier_ID INT NOT NULL,
  Birth_Date DATE NOT NULL,
  Soldier_Rank VARCHAR2(20) NOT NULL,
  First_Name VARCHAR2(20) NOT NULL,
  Last_Name VARCHAR2(20) NOT NULL,
  Unit VARCHAR2(20),
  PRIMARY KEY (Soldier_ID)
);

CREATE TABLE Storeman (
  Soldier_ID INT NOT NULL,
  Hours_Per_Week FLOAT NOT NULL,
  Store_ID INT NOT NULL,
  PRIMARY KEY (Soldier_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Soldier(Soldier_ID),
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

CREATE TABLE Supplier
(
  Company_Name VARCHAR2(40) NOT NULL,
  Email VARCHAR2(40) NOT NULL,
  Location VARCHAR2(40) NOT NULL,
  Company_ID INT NOT NULL,
  PRIMARY KEY (Company_ID)
);


CREATE TABLE Weapon (
  Weapon_Type VARCHAR2(40) NOT NULL,
  Weight FLOAT,
  Serial_Number INT NOT NULL,
  Reliability INT NOT NULL,
  PRIMARY KEY (Serial_Number),
  FOREIGN KEY (Serial_Number) REFERENCES Item(Serial_Number)
);

CREATE TABLE Uniform (
  Uniform_Type VARCHAR2(40) NOT NULL,
  Uniform_Size VARCHAR2(10) NOT NULL,
  Serial_Number INT NOT NULL,
  Officiality VARCHAR2(10),
  PRIMARY KEY (Serial_Number),
  FOREIGN KEY (Serial_Number) REFERENCES Item(Serial_Number)
);

CREATE TABLE Owns (
  Serial_Number INT NOT NULL,
  Soldier_ID INT NOT NULL,
  PRIMARY KEY (Serial_Number),
  FOREIGN KEY (Serial_Number) REFERENCES Item(Serial_Number),
  FOREIGN KEY (Soldier_ID) REFERENCES Soldier(Soldier_ID)
);

CREATE TABLE Supplies (
  Company_ID INT NOT NULL,
  Store_ID INT NOT NULL,
  PRIMARY KEY (Company_ID, Store_ID),
  FOREIGN KEY (Company_ID) REFERENCES Supplier(Company_ID),
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);
