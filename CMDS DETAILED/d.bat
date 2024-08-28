@echo off

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
echo Current Date is %mydate%
setlocal
for /f "delims=" %%a in ('wmic path win32_localtime get dayofweek /format:list ') do for /f "delims=" %%d in ("%%a") do set %%d

for /f %%i in ('powershell ^(get-date^).DayOfWeek') do set dow=%%i

echo Curretn Day is %dow%

echo Current Time is %mytime%

for /f "tokens=1,2 delims=_" %%a in ('powershell get-date -UFormat "%%Y_%%B"') do set "y=%%a" & set "m=%%b"
echo Year is %y% 
echo Month is %m%

@echo off
(
echo s=DateAdd("d",0,now^)
echo WScript.Echo Cstr(year(s^)^)+" "+Cstr(right(100+month(s^)-1,2^)^)
)>"%temp%\%~n0.vbs"

for /f "tokens=1,2" %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "YYYY=%%a" & set "MM=%%b"
del "%temp%\%~n0.vbs"
if "%MM%"=="00" set "MM=12" & set /a YYYY=YYYY-1
set "data=%MM%"
echo last month was %data%
set /a YYYY=YYYY-1
set "d=%YYYY%"
echo the last Year %d%
pause
