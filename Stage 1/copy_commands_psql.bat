@echo off

psql -h localhost -U postgres -d postgres -p 5432 -c "\copy aircraft from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\aircrafts.csv' WITH (FORMAT csv, HEADER true);"
psql -h localhost -U postgres -d postgres -p 5432 -c "\copy airport from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\airports.csv' WITH (FORMAT csv, HEADER true);"
psql -h localhost -U postgres -d postgres -p 5432 -c "\copy gate from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\gates.csv' WITH (FORMAT csv, HEADER true);"
psql -h localhost -U postgres -d postgres -p 5432 -c "\copy weather from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\weather.csv' WITH (FORMAT csv, HEADER true);"
psql -h localhost -U postgres -d postgres -p 5432 -c "\copy flight from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\flights.csv' WITH (FORMAT csv, HEADER true);"
psql -h localhost -U postgres -d postgres -p 5432 -c "\copy passenger from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\passengers.csv' WITH (FORMAT csv, HEADER true);"
psql -h localhost -U postgres -d postgres -p 5432 -c "\copy crew from 'C:\Users\a3210\Machon Lev\Year 4\Semester B\Database Mini Project\Project\Database-Mini-Project\Stage 1\Data\crew.csv' WITH (FORMAT csv, HEADER true);"
