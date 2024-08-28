@echo off

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
echo Current Date is %mydate%
setlocal
for /f "delims=" %%a in ('wmic path win32_localtime get dayofweek /format:list ') do for /f "delims=" %%d in ("%%a") do set %%d

echo day of the week : %dayofweek%
echo Current Time is %mytime%

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set dt=%%a
set year=%dt:~0,4%
set month=%dt:~4,2%
set day=%dt:~6,2%

rem set month name for the corresponding numbers

if %month%==01 set monthname=JANUARY
if %month%==02 set monthname=FEBRUARY
if %month%==03 set monthname=MARCH
if %month%==04 set monthname=APRIL
if %month%==05 set monthname=MAY
if %month%==06 set monthname=JUNE
if %month%==07 set monthname=JULY
if %month%==08 set monthname=AUGUST
if %month%==09 set monthname=SEPTEMBER
if %month%==10 set monthname=OCTOBER
if %month%==11 set monthname=NOVEMBER
if %month%==12 set monthname=DECEMBER

rem print month name
echo %month%
echo %monthname%
for /F “tokens=2” %i in (‘date /t’) do echo %i
pause