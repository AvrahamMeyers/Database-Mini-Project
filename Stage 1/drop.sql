-- Set search path to the schema
SET search_path TO "Airport Schedule";

-- Drop tables
DROP TABLE IF EXISTS Passenger CASCADE;
DROP TABLE IF EXISTS Crew CASCADE;
DROP TABLE IF EXISTS Flight CASCADE;
DROP TABLE IF EXISTS Weather CASCADE;
DROP TABLE IF EXISTS Gate CASCADE;
DROP TABLE IF EXISTS Airport CASCADE;
DROP TABLE IF EXISTS Aircraft CASCADE;

-- Drop types
DROP TYPE IF EXISTS flight_status;
DROP TYPE IF EXISTS aircraft_status;
DROP TYPE IF EXISTS crew_type;
DROP TYPE IF EXISTS gate_status;
DROP TYPE IF EXISTS weather_condition;

-- Drop schema (optional, if you want to remove the schema as well)
DROP SCHEMA IF EXISTS "Airport Schedule" CASCADE;
