# AirlineSchedulingSystem_DatabaseProject
# Work By: Avraham Meyers and Eli Isaacs

As part of the class project of an airline management system, we are tasked with the scheduling system.
This involves the following entities:  
• Flight
• Aircraft
• Crew
• Gate
• Airport
• Weather

Our system for scheduling is modeled around the 'Flight' entity, as we account for all flight information to assign flights the proper aircraft, crew members, and the gates and airports for departure and arrival. Additionally we account for the weather conditions at the respective airports. 'Flight' has a many-to-one relationship with 'Aircraft' because each flight uses a single aircraft, while an aircraft can be used for multiple flights at different times. 'Flight' has many-to-one relationships with both Departure Gate and Arrival as multiple different flights could leave and arrive at the same gate, just not at the same time. 'Flight' has many-to-one relationships with both Departure Airport and Arrival as multiple flights could come from the same departure airport and multiple flights could arrive at an arrival airport. 'Flight' has a one-to-many (optional) relationship with 'Crew' because a flight can have multiple crew members assigned (pilots, first officer, steward). Some crew members might not necessarily be assigned to a flight, therefore the 'Crew' table's foreign key to 'Flight' is nullable. 'Gate' has a many-to-one relationship with 'Airport' because there are multiple gates that belong to a specific airport. 'Gate' has a 'Flight' that uses specific gates at departure and arrival gates as well as airports, as described earlier. The 'Airport' has flights depart and arrive at specific airports. An airport can have multiple departing and arriving flights. 'Weather' has a many-to-one relationship with 'Airport' because weather data is recorded for a specific airport at a specific time. An airport can have multiple weather entries over time.

ERD:
![alt text](<Stage 1/erd.png>)


DSD:
![alt text](<Stage 1/DSD.png>)


Output from copy data file:

![alt text](image.png)
