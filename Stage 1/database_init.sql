CREATE TYPE aircraft_type as ENUM ("Airbus A320", "Airbus A380", "Boeing 737", "Boeing 747", "Boeing 787");

CREATE TYPE weather_condition as ENUM ("Clear skies", "Partly cloudy", "Light rain", "Snow", 
                                "Heavy rain", "Foggy", "Strong wind", "Thunderstorms with rain", 
                                "Thunderstorms with lightning", "Frost", "Icy runway");
CREATE TYPE terminal_name as ENUM ("A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                                    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                                    "U", "V", "W", "X", "Y", "Z");
CREATE TYPE gate_status as ENUM ("Available", "Occupied", "Under maintenance");

CREATE TYPE crew_type as ENUM ("Pilot", "First Officer", "Steward");

CREATE TYPE aircraft_status as ENUM ("In flight", "Boarding", "Deboarding", "Taxiing", "Under maintenance",
                                "Parked");

CREATE TYPE flight_status as ENUM ("On time", "Delayed", "Cancelled");

CREATE TABLE Aircraft
(
  Aircraft_Type aircraft_type NOT NULL,
  Current_Status aircraft_status NOT NULL,
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
  Terminal_Name terminal_name NOT NULL,
  Gate_Number INT NOT NULL,
  Gate_ID INT NOT NULL,
  Status VARCHAR NOT NULL,
  Airport_ID INT NOT NULL,
  PRIMARY KEY (Gate_ID),
  FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Weather
(
  Conditions weather_condition NOT NULL,
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
  Flight_Status flight_status NOT NULL,
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
  Crew_Type crew_type NOT NULL,
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