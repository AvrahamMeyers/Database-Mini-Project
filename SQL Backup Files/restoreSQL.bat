@echo off
setlocal

rem Define variables
set DB_NAME=postgres
set DB_USER=postgres
set BACKUP_FILE=backupSQL.sql
set LOG_FILE=restoreSQL.log

rem Drop the existing database (use with caution)
echo Dropping the existing database... > %LOG_FILE%
dropdb --username=%DB_USER% %DB_NAME% >> %LOG_FILE% 2>&1

rem Create a new database
echo Creating a new database... >> %LOG_FILE%
createdb --username=%DB_USER% %DB_NAME% >> %LOG_FILE% 2>&1

rem Restore the database using psql
echo Restoring the database... >> %LOG_FILE%
(for /f "tokens=1-4 delims=:.," %%a in ('echo %%time%%') do set start=%%a%%b%%c%%d)
psql --username=%DB_USER% --dbname=%DB_NAME% --file=%BACKUP_FILE% >> %LOG_FILE% 2>&1
(for /f "tokens=1-4 delims=:.," %%a in ('echo %%time%%') do set end=%%a%%b%%c%%d)

set /a duration=end-start
echo Restore duration: %duration% seconds >> "%LOG_FILE%"
echo Restoration complete. >> %LOG_FILE%

endlocal
