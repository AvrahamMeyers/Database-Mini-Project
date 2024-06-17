@echo off
setlocal

rem Define variables
set DB_NAME=postgres
set DB_USER=postgres
set BACKUP_FILE=backupSQL.sql
set LOG_FILE=backupSQL.log

rem Run pg_dump and log the output
echo Starting backup... > %LOG_FILE%
echo. >> %LOG_FILE%

rem Time the pg_dump command and log it
(for /f "tokens=1-4 delims=:.," %%a in ('time /t') do set start=%%a%%b%%c%%d)
pg_dump --file=%BACKUP_FILE% --host "localhost" --port "5432" --username "postgres" --format=p --inserts --rows-per-insert "1000" --verbose --dbname=%DB_NAME% >> %LOG_FILE% 2>&1
rem pg_dump --username=%DB_USER% --dbname=%DB_NAME% --format=p --file=%BACKUP_FILE% >> %LOG_FILE% 2>&1
(for /f "tokens=1-4 delims=:.," %%a in ('time /t') do set end=%%a%%b%%c%%d)

set /a duration=%end%-%start%
echo Backup duration: %duration% seconds >> %LOG_FILE%

endlocal
