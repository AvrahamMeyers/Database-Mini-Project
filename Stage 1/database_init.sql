CREATE TABLE Aircraft
(
  Aircraft_Type VARCHAR NOT NULL,
  Current_Status VARCHAR NOT NULL,
  Aircraft_ID INT NOT NULL,
  PRIMARY KEY (Aircraft_ID)
);

CREATE TABLE Airport
(
  Airport_ID INT NOT NULL,
  Name VARCHAR NOT NULL,
  City VARCHAR NOT NULL,
  PRIMARY KEY (Airport_ID)
);

CREATE TABLE Gate
(
  Terminal_Name VARCHAR NOT NULL,
  Gate_Number VARCHAR NOT NULL,
  Gate_ID INT NOT NULL,
  Status VARCHAR NOT NULL,
  Airport_ID INT NOT NULL,
  PRIMARY KEY (Gate_ID),
  FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Weather
(
  Conditions VARCHAR NOT NULL,
  Update_Time DATE NOT NULL,
  Weather_ID INT NOT NULL,
  Airport_ID INT NOT NULL,
  PRIMARY KEY (Weather_ID),
  FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Flight
(
  Departure_Time DATE NOT NULL,
  Arrival_Time DATE NOT NULL,
  Flight_Number INT NOT NULL,
  Aircraft_ID INT NOT NULL,
  Departure_Gate_ID INT NOT NULL,
  Departure_Airport_ID INT NOT NULL,
  Arrival_Airport_ID INT NOT NULL,
  Arrival_Gate_ID INT NOT NULL,
  PRIMARY KEY (Flight_Number),
  FOREIGN KEY (Aircraft_ID) REFERENCES Aircraft(Aircraft_ID),
  FOREIGN KEY (Departure_Gate_ID) REFERENCES Gate(Gate_ID),
  FOREIGN KEY (Departure_Airport_ID) REFERENCES Airport(Airport_ID),
  FOREIGN KEY (Arrival_Airport_ID) REFERENCES Airport(Airport_ID),
  FOREIGN KEY (Arrival_Gate_ID) REFERENCES Gate(Gate_ID)
);

CREATE TABLE Crew
(
  Crew_Type VARCHAR NOT NULL,
  Member_Name VARCHAR NOT NULL,
  Crew_ID INT NOT NULL,
  Flight_Number INT,
  PRIMARY KEY (Crew_ID),
  FOREIGN KEY (Flight_Number) REFERENCES Flight(Flight_Number)
);

CREATE TABLE Passenger
(
  Name VARCHAR NOT NULL,
  Ticket_Number INT NOT NULL,
  Passenger_ID INT NOT NULL,
  Flight_Number INT NOT NULL,
  PRIMARY KEY (Passenger_ID),
  FOREIGN KEY (Flight_Number) REFERENCES Flight(Flight_Number)
);