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
3. Get flights that do not have a pilot
4. Get flights with matching weather conditions at the departure and arrival airports 

# Update Queries:
1. Update gates to available if flight is departed from departure gate
2. Update all flights whose aircraft status was Boarding to flight status Gate Closed

# Delete Queries:
1. Delete flights whose aircraft status is Under Maintenance
2. Delete the oldest weather for each airport

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