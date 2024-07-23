# AirlineSchedulingSystem_DatabaseProject
## Work By: Avraham Meyers and Eli Isaacs

As part of the class project of an airline management system, we are tasked with the scheduling system. This involves the following entities:

- Flight
- Aircraft
- Crew
- Gate
- Airport
- Weather
- Passenger

Our system for scheduling is modeled around the **Flight** entity, as we account for all flight information to assign flights the proper aircraft, crew members, and the gates and airports for departure and arrival, and the relevant passengers for the flight. Additionally, we account for the weather conditions at the respective airports.


### Entity Relationships

- **Flight**:
  - Many-to-One relationship with **Aircraft**: Each flight uses a single aircraft, while an aircraft can be used for multiple flights at different times.
  - Many-to-One relationship with both **Departure Gate** and **Arrival Gate**: Multiple different flights could leave and arrive at the same gate, just not at the same time.
  - Many-to-One relationship with both **Departure Airport** and **Arrival Airport**: Multiple flights could come from the same departure airport and multiple flights could arrive at an arrival airport.
  - One-to-Many (optional) relationship with **Crew**: A flight can have multiple crew members assigned (pilots, first officer, steward). Some crew members might not necessarily be assigned to a flight, therefore the **Crew** table's foreign key to **Flight** is nullable.

- **Gate**:
  - Many-to-One relationship with **Airport**: There are multiple gates that belong to a specific airport. Each gate is used by specific flights for departure and arrival as well as at the airports.

- **Passenger**:
  - One-to-Many relationship with **Flight**: Each passenger has one flight

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
[Queries](Queries2.sql)
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

Queries log output:
Without indexes: [queries output](Queries.log)
With indexes: [queries output](IndexedQueries.log)

### Parameterized Queries:
1. Get the specific flight that a crew member is assigned to
2. Get the destination airport of a passenger using their ticket number
3. Update the weather conditions at a specific airport
4. Update a passenger's ticket number and flight number when they buy a new ticket


### Indexes
[indexes](Constraints.sql)

1. Index on Aircraft_ID in the Flight table
 - Query Benefitted: Update flights and delete flights based on Aircraft_ID.
2. Index on Current_Status in the Aircraft table
 - Query Benefitted: Update flights based on Aircraft status and delete flights based on Aircraft status.
3. Index on Weather Update Time
 - Query Benefitted: Deleting the oldest weather for each airport and updating weather conditions

### Queries Runtime Results
| Query Number | Runtime Without Indexing (ms) | Runtime With Indexing (ms) | Indexes used                                     |
|--------------|-------------------------------|----------------------------|--------------------------------------------------|
| 1            | 159366.594                    | 45310.846                  | Weather Update Time                              |
| 2            | 42.486                        | 54.767                     |                                                  |
| 3            | 108.023                       | 80.780                     |                                                  |
| 4            | 151728.125                    | 4409.059                   |                                                  |
| 5            | 109.963                       | 41.476                     |                                                  |
| 6            | 146.417                       | 6.622                      | Aircraft Current Status                          |
| 7            | 225,362.711                   | 143,413.956                | Aircraft Current Status                          |
| 8            | 1023515.512                   | 112550.590                 | Weather Update Time                              |
| 9            | N/A                           | 117.233                    |                                                  |
| 10           | N/A                           | 26.862                     |                                                  |
| 11           | N/A                           | 1229.549                   |                                                  |

### Parameterized Queries Runtime Results
| Query Number | Runtime Without Indexing (ms) | Runtime With Indexing (ms) | Indexes used                                     |
|--------------|-------------------------------|----------------------------|--------------------------------------------------|
| 1            | 15.224                        | 8.114                      |                                                  |
| 2            | 84.147                        | 50.700                     |                                                  |
| 3            | 8.556                         | 4.399                      |                                                  |
| 4            | 1.756                         | 1.125                      |                                                  |


### Constraints
[constraints](Constraints.sql)

1. No flight can have the same departure and arrival airport
2. Flight cannot have same departure and arrival time
3. Every passenger on the same flight must have unique ticket number
4. departure time of flight must be before arrival time of flight

# Output of queries that break constraints: [constraints.log](Constraints.log)


### Stage 3

# Queries

1. Retrieve flight details with crew members and their types
2. Retrieve flights that are delayed along with the aircraft type and the departure airport city
3. Update the flight status to 'Cancelled' for flights departing from airports where the weather is 'Thunderstorms with lightning'

Queries are created [here](Queries.sql)

User Sub-Groups:
1. Passengers and Customer Service Reps: They need to see the details of the flights and their current status. View name: Passenger_View
2. Maintenance Team: They need to get a snapshot of all of the aircraft that are currently under maintenance, along with the aircrafts future schedules. View name: Maintenance_View
3. Crew Scheduling Team: They need to manage and schedule crew assignments with a comprehensive overview of crew members, their assigned flights, and the corresponding departure and arrival airports. View name: Crew_Scheduling_View
4. Flight Operations Team: They need to identify flights that might be impacted by severe weather conditions. This view helps them assess potential delays or disruptions and take necessary actions to mitigate the impact. View name: Weather_Impact_Report

The views are created [here](Views.sql)

Queries for the views are [here](ViewQueries.sql). 
The output from the queries is logged [here](ViewQueries.log)

### Visualizations

Visualization for View 4


Query 1: This query shows the total number of delayed flights due to heavy rain, aggregated over the months of the year
``` SQL
SELECT 
    COUNT(*) AS total_delays,
    EXTRACT(MONTH FROM departure_time) AS month
FROM 
    Weather_Impact_Report
WHERE 
    Flight_status = 'Delayed' 
    AND Weather_conditions = 'Heavy rain'
GROUP BY 
    EXTRACT(MONTH FROM departure_time)
ORDER BY 
    month;
```

![View4BarChart](<Query1BarChart.png>)

Visualization for View 1

Query 2: This query shows the total number of passengers who flew on each calendar day of the year, aggregated over all the years of operation

``` SQL
SELECT 
	COUNT(*),
	TO_CHAR(departure_time, 'MM-DD') AS month_day
	FROM Passenger_View
GROUP BY
	TO_CHAR(departure_time, 'MM-DD')
ORDER BY
	TO_CHAR(departure_time, 'MM-DD')
```

![View1LineChart](<Query2LineChart.png>)


### Functions
We created four functions to make the queries more readable and reusable as well.

1. Function 1: get_recent_weather() Returns the most recent weather conditions for each airport
2. Function 2: cancel_flights_due_to_weather(weather_condition VARCHAR) Cancels all flights that are scheduled to depart from an airport with the specified weather condition
3. Function 3: get_all_flights_by_status(flight_status VARCHAR) Returns all flights with a specific status with the following columns: Flight_Number, Departure_Time, Aircraft_Type, Departure_City
4. Function 4: get_total_flights_for_airport(airport_id INT) Returns the total number of flights for a specific airport

[Function Creation](Functions.sql)

Query Timing Analysis:
| Query Number | Runtime Without Function (ms) | Runtime With Function (ms) | Function Used                                    |
|--------------|-------------------------------|----------------------------|--------------------------------------------------|
| 1            | 45310.846                     | 143359.596                 | get_recent_weather                               |
| 11           | 1229.549                      | 99770.155                  | cancel_flights_due_to_weather                    |
| 10           | 26.862                        | 46.922                     | get_all_flights_by_status                        |
| 2            | 54.767                        | 382903.958                 | get_total_flights_for_airport                    |

[Full Queries Logging](Queries.log)

### Triggers

1. Flight Status Update:
Activated after update of flights status
The trigger updates the status of the aircraft for that flight based on the flight status
    - Departed : In flight
    - Boarding : Boarding
    - Delayed : Taxiing
    - Cancelled : Under maintenance
    - On time : Parked

2. Weather Update:
Activated after new weather is added to Weather table
Updates flight status of flights that are departing from that airport within the next day
    - Weather condition: Snow, Heavy rain, Foggy, Strong wind : Delayed
    - Weather condition: Thunderstorms with rain, Thunderstorms with lightning, Frost, Icy runway: Cancelled

Trigger Queries:
Updating Flight Status to Departed

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

Flight Table

Previous flight table value:
| flight_number | departure_time | arrival_time | flight_status | aircraft_id | departure_gate_id | departure_airport_id | arrival_gate_id | arrival_airport_id  |
|---------------|----------------|--------------|---------------|-------------|-------------------|----------------------|-----------------|--------------------|
|         21908 | 2020-10-02     | 2020-10-02   | Boarding      |       99153 |             88071 |                 3195 |           51832 |               3935

Previous Aircraft value - status is Boarding
| aircraft_id | aircraft_type | current_status |
|-------------|---------------|----------------|
|       99153 | Airbus A380   | Boarding       |

After updating flight table value:
| flight_number | departure_time | arrival_time | flight_status | aircraft_id | departure_gate_id | departure_airport_id | arrival_gate_id | arrival_airport_id  |
|---------------|----------------|--------------|---------------|-------------|-------------------|----------------------|-----------------|--------------------|
|         21908 | 2020-10-02     | 2020-10-02   | Departed      |       99153 |             88071 |                 3195 |           51832 |               3935

After updating the flight status - aircraft status is In Flight
| aircraft_id | aircraft_type | current_status |
|-------------|---------------|----------------|
|       99153 | Airbus A380   | In flight      |

Inserting new Weather instance:

Weather Table:
| airport_id | airport_name | recent_weather_id |    recent_conditions    | recent_update_time |
|------------|--------------|-------------------|-------------------------|--------------------|
|       4740 | ADX          |                 1 | Thunderstorms with rain | 2024-07-23         |

Previous Flight Table value:
| flight_number | departure_time | arrival_time | flight_status | aircraft_id | departure_gate_id | departure_airport_id | arrival_gate_id | arrival_airport_id  |
|---------------|----------------|--------------|---------------|-------------|-------------------|----------------------|-----------------|--------------------|
|         58924 | 2024-07-23     | 2022-04-21   | Boarding      |       27323 |             62272 |                 4740 |           29384 |               7566
|         26420 | 2024-07-24     | 2023-08-01   | On time       |       42408 |             21619 |                 4740 |           38734 |               3140

New Flight table value: status has been updated to cancelled
| flight_number | departure_time | arrival_time | flight_status | aircraft_id | departure_gate_id | departure_airport_id | arrival_gate_id | arrival_airport_id  |
|---------------|----------------|--------------|---------------|-------------|-------------------|----------------------|-----------------|--------------------|
|         58924 | 2024-07-23     | 2022-04-21   | Cancelled     |       27323 |             62272 |                 4740 |           29384 |               7566
|         26420 | 2024-07-24     | 2023-08-01   | Cancelled     |       42408 |             21619 |                 4740 |           38734 |               3140

