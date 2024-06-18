# AirlineSchedulingSystem_DatabaseProject
## Work By: Avraham Meyers and Eli Isaacs

As part of the class project of an airline management system, we are tasked with the scheduling system. This involves the following entities:

- Flight
- Aircraft
- Crew
- Gate
- Airport
- Weather
- Passengers

Our system for scheduling is modeled around the **Flight** entity, as we account for all flight information to assign flights the proper aircraft, crew members, and the gates and airports for departure and arrival. Additionally, we account for the weather conditions at the respective airports.

TODO: add passenger info
### Entity Relationships

- **Flight**:
  - Many-to-One relationship with **Aircraft**: Each flight uses a single aircraft, while an aircraft can be used for multiple flights at different times.
  - Many-to-One relationship with both **Departure Gate** and **Arrival Gate**: Multiple different flights could leave and arrive at the same gate, just not at the same time.
  - Many-to-One relationship with both **Departure Airport** and **Arrival Airport**: Multiple flights could come from the same departure airport and multiple flights could arrive at an arrival airport.
  - One-to-Many (optional) relationship with **Crew**: A flight can have multiple crew members assigned (pilots, first officer, steward). Some crew members might not necessarily be assigned to a flight, therefore the **Crew** table's foreign key to **Flight** is nullable.

- **Gate**:
  - Many-to-One relationship with **Airport**: There are multiple gates that belong to a specific airport. Each gate is used by specific flights for departure and arrival as well as at the airports.

- **Airport**:
  - Has flights departing and arriving at specific airports. An airport can have multiple departing and arriving flights.

- **Weather**:
  - Many-to-One relationship with **Airport**: Weather data is recorded for a specific airport at a specific time. An airport can have multiple weather entries over time.

### ERD Diagram
![alt text](<Stage 1/erd.png>)


### DSD Diagram
![alt text](<Stage 1/DSD.png>)

### Repository Files
- First run the following file: [database_init.sql](https://github.com/AvrahamMeyers/Database-Mini-Project/blob/main/Stage%201/database_init.sql)
- The drop file to delete the database: [drop.sql](https://github.com/AvrahamMeyers/Database-Mini-Project/blob/main/Stage%201/drop.sql)
- The file to create randomly generated data: [create_data.ipynb](https://github.com/AvrahamMeyers/Database-Mini-Project/blob/main/Stage%201/create_data.ipynb)

### Output from copy data file:
![alt text](image.png)


### Backup and Restore

We used batch files to run the pg_dump and pg_restore commands

# SQL Backup
- Backup File: [backupSQL.bat](<SQL Backup Files/backupSQL.bat>)
- Output File: [backupSQL.sql](<SQL Backup Files/backupSQL.sql>)
- Backup Log File: [backupSQL.log](<SQL Backup Files/backupSQL.log>)
- Restore File: [restoreSQL.bat](<SQL Backup Files/restoreSQL.bat>)
- Restore Log File: [restoreSQL.log](<SQL Backup Files/restoreSQL.log>)

# PSQl Backup
- Backup File: [backupPSQL.bat](<PSQL Backup Files/backupPSQL.bat>)
- Output File: [backupPSQL.sql](<PSQL Backup Files/backupPSQL.sql>)
- Backup Log File: [backupPSQL.log](<PSQL Backup Files/backupPSQL.log>)
- Restore File:[restorePSQL.bat](<PSQL Backup Files/restorePSQL.bat>)
- Restore Log File: [restorePSQL.log](<PSQL Backup Files/restorePSQL.log>)


### Queries:

# Select Queries:
1. Get all flights with gate, airport and weather information
2. Get all airports and the total number of flights for each airport
3. Get all flights that do not have a pilot
4. Get all flights with matching weather conditions at the departure and arrival airports 

# Update Queries:
1. 
2. Update all flights whose aircraft status was Boarding to flight status Gate Closed

# Delete Queries:
1. Delete flights whose aircraft status is Under Maintenance
2. Delete 

### Parameterized Queries:
1. Update all flights whose destination was ... to ...
2. 
3.
4.



### Indexes





### Constraints
1. No flight can have the same departure and arrival airport
2. Every flight must have a pilot
3. 

-- Paramaterization 1
-- Get the specific flight that a crew member is assigned to
    PREPARE Flight_Assignment_For_Crew (text) AS
    SELECT f.Flight_Number,
           f.Departure_Time,
           f.Arrival_Time,
           f.Flight_Status,
           a.Aircraft_Type,
           a.Current_Status,
           d_airport.Name AS Departure_Airport,
           d_gate.Gate_Number AS Departure_Gate,
           a_airport.Name AS Arrival_Airport,
           a_gate.Gate_Number AS Arrival_Gate
    FROM Crew c
    JOIN Flight f ON c.Flight_Number = f.Flight_Number
    JOIN Aircraft a ON f.Aircraft_ID = a.Aircraft_ID
    JOIN Gate d_gate ON f.Departure_Gate_ID = d_gate.Gate_ID
    JOIN Airport d_airport ON f.Departure_Airport_ID = d_airport.Airport_ID
    JOIN Gate a_gate ON f.Arrival_Gate_ID = a_gate.Gate_ID
    JOIN Airport a_airport ON f.Arrival_Airport_ID = a_airport.Airport_ID
    WHERE c.Member_Name = $1;

    EXECUTE Flight_Assignment_For_Crew('Ashley Wheeler');

-- Paramaterization 2
-- Get the destination airport of a passenger using their ticket number
    PREPARE Destination_Airport_For_Passenger (text) AS
    SELECT a_airport.Name AS Destination_Airport
    FROM Passenger p
    JOIN Flight f ON p.Flight_Number = f.Flight_Number
    JOIN Airport a_airport ON f.Arrival_Airport_ID = a_airport.Airport_ID
    WHERE p.Ticket_Number = $1;

    EXECUTE Destination_Airport_For_Passenger('ZOMYM4U7S6');

-- Paramaterization 3
-- Update the weather conditions at a specific airport
    PREPARE Update_Weather_At_Airport (integer, weather_condition, date, integer) AS
    UPDATE Weather
    SET Conditions = $2,  
        Update_Time = $3  
    WHERE Weather_ID = $1  
      AND Airport_ID = $4;

    EXECUTE Update_Weather_At_Airport(10004, 'Foggy', '2024-06-18', 2021);

-- Paramaterization 4
-- Update a passenger's ticket number and flight number when they buy a new ticket
    PREPARE update_passenger_ticket (
    int,      
    varchar,   
    varchar,   
    varchar, 
    int,       
    int      
    ) AS
    UPDATE Passenger
    SET Ticket_Number = $4,       -- New Ticket_Number
        Flight_Number = $6       -- New Flight_Number
    WHERE Passenger_ID = $1       -- Passenger_ID
    AND Member_Name = $2           -- Member_Name
    AND Ticket_Number = $3        -- Old Ticket_Number
    AND Flight_Number = $5;    

    EXECUTE update_passenger_ticket(100022, 'Stephanie Garcia', 'ZOMYM4U7S6', 'TOMYM4U7S6', 84206, 94206);
  







