@echo off
setlocal

rem Define variables
set "DB_NAME=postgres"
set "DB_USER=postgres"
set "BACKUP_FILE=backupPSQL.sql"
set "LOG_FILE=restorePSQL.log"

rem Start logging
echo Dropping the existing database... > "%LOG_FILE%"
dropdb --username="%DB_USER%" "%DB_NAME%" >> "%LOG_FILE%" 2>&1

if %errorlevel% neq 0 (
    echo Error dropping the database. Check the log file for details. >> "%LOG_FILE%"
    goto end
)

rem Create a new database
echo Creating a new database... >> "%LOG_FILE%"
createdb --username="%DB_USER%" "%DB_NAME%" >> "%LOG_FILE%" 2>&1

if %errorlevel% neq 0 (
    echo Error creating the database. Check the log file for details. >> "%LOG_FILE%"
    goto end
)

rem Restore the database using pg_restore
echo Starting restore... >> "%LOG_FILE%"
(for /f "tokens=1-4 delims=:.," %%a in ('echo %%time%%') do set start=%%a%%b%%c%%d)
pg_restore --username="%DB_USER%" --dbname="%DB_NAME%" --disable-triggers --verbose "%BACKUP_FILE%" >> "%LOG_FILE%" 2>&1

if %errorlevel% neq 0 (
    echo Error during restore. Check the log file for details. >> "%LOG_FILE%"
    goto end
)
(for /f "tokens=1-4 delims=:.," %%a in ('echo %%time%%') do set end=%%a%%b%%c%%d)

set /a duration=end-start
echo Restore duration: %duration% seconds >> "%LOG_FILE%"

echo Restoration complete. >> "%LOG_FILE%"

:end
endlocal
