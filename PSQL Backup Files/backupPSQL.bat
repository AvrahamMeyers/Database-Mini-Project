@echo off
setlocal

rem Define variables
set DB_NAME=postgres
set DB_USER=postgres
set BACKUP_FILE=backupPSQL.sql
set LOG_FILE=backupPSQL.log

rem Create PSQL backup file
echo Starting backup... > "%LOG_FILE%"
echo. >> "%LOG_FILE%"

rem Time the pg_dump command and log it
(for /f "tokens=1-4 delims=:.," %%a in ('echo %time%') do set start=%%a%%b%%c%%d)
pg_dump --username=%DB_USER% --dbname=%DB_NAME% --format=c --file=%BACKUP_FILE% >> "%LOG_FILE%" 2>&1
(for /f "tokens=1-4 delims=:.," %%a in ('echo %time%') do set end=%%a%%b%%c%%d)

set /a duration=end-start
echo Backup duration: %duration% seconds >> "%LOG_FILE%"

endlocal
