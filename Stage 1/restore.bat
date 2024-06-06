@echo off
REM Check if the correct number of arguments is passed
if "%~1"=="" (
    echo missing path to sql file
    goto :eof
)

REM Set variables
SET PGUSER=postgres
SET PGPASSWORD=%PGPASSWORD%
SET PGDATABASE=postgres
SET PGHOST=localhost
SET DUMP_FILE=%~1


REM Optional: Drop and recreate the database
REM psql -U %PGUSER% -c "DROP DATABASE IF EXISTS %PGDATABASE%"
REM psql -U %PGUSER% -c "CREATE DATABASE %PGDATABASE%"

echo %DUMP_FILE%

psql -h %PGHOST% -U %PGUSER% -d %PGDATABASE% -f "%DUMP_FILE%"

REM Check if the restore was successful
if %ERRORLEVEL% NEQ 0 (
    echo Restore failed.
) else (
    echo Restore completed successfully.
)

REM Pause to view the output
pause
