-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS Public;

-- Set search path to the schema
SET search_path TO Public;

CREATE TYPE aircraft_type as ENUM ('Airbus A320', 'Boeing 737', 'Boeing 747', 'Airbus A380', 'Boeing 787');

CREATE TYPE weather_condition AS ENUM ('Clear skies', 'Partly cloudy', 'Light rain', 'Snow', 
                                       'Heavy rain', 'Foggy', 'Strong wind', 'Thunderstorms with rain', 
                                       'Thunderstorms with lightning', 'Frost', 'Icy runway');
                                
CREATE TYPE gate_status AS ENUM ('Available', 'Occupied', 'Under maintenance');

CREATE TYPE crew_type AS ENUM ('Pilot', 'First Officer', 'Steward');

CREATE TYPE aircraft_status AS ENUM ('In flight', 'Boarding', 'Deboarding', 'Taxiing', 'Under maintenance', 'Parked');

CREATE TYPE flight_status AS ENUM ('Boarding', 'Gate Closed', 'On time', 'Delayed', 'Departed',
                            'Diverted', 'Cancelled', 'En Route');

CREATE TABLE Aircraft
(
  Aircraft_ID INT PRIMARY KEY,
  Aircraft_Type aircraft_type NOT NULL,
  Current_Status aircraft_status NOT NULL
);

CREATE TABLE Airport
(
  Airport_ID INT PRIMARY KEY,
  Name VARCHAR NOT NULL,
  City VARCHAR NOT NULL
);

CREATE TABLE Gate
(
  Gate_ID INT PRIMARY KEY,
  Terminal_Name CHAR(1) NOT NULL,
  Gate_Number VARCHAR(3) NOT NULL,
  Status gate_status NOT NULL,
  Airport_ID INT NOT NULL,
  FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID),
  CHECK (Terminal_Name BETWEEN 'A' AND 'Z')
);

CREATE TABLE Weather
(
  Weather_ID INT PRIMARY KEY,
  Conditions weather_condition NOT NULL,
  Update_Time DATE NOT NULL,
  Airport_ID INT NOT NULL,
  FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Flight
(
  Flight_Number INT PRIMARY KEY,
  Departure_Time DATE NOT NULL,
  Arrival_Time DATE NOT NULL,
  Flight_Status flight_status NOT NULL,
  Aircraft_ID INT NOT NULL,
  Departure_Gate_ID INT NOT NULL,
  Departure_Airport_ID INT NOT NULL,
  Arrival_Gate_ID INT NOT NULL,
  Arrival_Airport_ID INT NOT NULL,
  FOREIGN KEY (Aircraft_ID) REFERENCES Aircraft(Aircraft_ID),
  FOREIGN KEY (Departure_Gate_ID) REFERENCES Gate(Gate_ID),
  FOREIGN KEY (Departure_Airport_ID) REFERENCES Airport(Airport_ID),
  FOREIGN KEY (Arrival_Airport_ID) REFERENCES Airport(Airport_ID),
  FOREIGN KEY (Arrival_Gate_ID) REFERENCES Gate(Gate_ID)
);

CREATE TABLE Crew
(
  Crew_ID INT PRIMARY KEY,
  Crew_Type crew_type NOT NULL,
  Member_Name VARCHAR NOT NULL,
  Flight_Number INT,
  FOREIGN KEY (Flight_Number) REFERENCES Flight(Flight_Number)
);

CREATE TABLE Passenger
(
  Passenger_ID INT PRIMARY KEY,
  Name VARCHAR NOT NULL,
  Ticket_Number VARCHAR NOT NULL,
  Flight_Number INT NOT NULL,
  FOREIGN KEY (Flight_Number) REFERENCES Flight(Flight_Number)
);
