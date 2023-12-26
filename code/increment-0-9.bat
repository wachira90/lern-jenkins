@echo off
setlocal enabledelayedexpansion

:: Set the initial value of the counter
set "counter=0"

:: Check if a counter file exists, and if so, read its value
if exist counter.txt (
    set /p counter=<counter.txt
)

:: Increment the counter
set /a "counter+=1"

:: Check if the counter has reached 9, and reset it to 0
if !counter! equ 10 (
    set "counter=0"
    echo Counter reset to 0
)

:: Display the current counter value
echo Current Counter Value: %counter%

:: Save the updated counter value to the file
echo %counter% > counter.txt

endlocal
