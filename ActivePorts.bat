@echo off
:: Get IP address
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr "IPv4"') do set IPAddress=%%A

:: Trim leading spaces from IP address
for /f "tokens=*" %%A in ("%IPAddress%") do set IPAddress=%%A

:: Display IP address
echo Your IPv4 address is: %IPAddress%

:: Check for open ports
echo Searching for open ports...
netstat -an | find "LISTENING" > open_ports.txt

if %ERRORLEVEL% equ 0 (
    echo Open ports found:
    type open_ports.txt
) else (
    echo No open ports were found.
)

:: Clean up
del open_ports.txt

:: Close script
pause
exit
