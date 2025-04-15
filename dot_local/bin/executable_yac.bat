@echo off
setlocal
set "YAZI_CWD_FILE=%TEMP%\yazi-cwd.%RANDOM%%RANDOM%.tmp"
set "TARGET_CWD="

REM Run yazi, passing all arguments (%*) and the temporary file path
yazi %* --cwd-file="%YAZI_CWD_FILE%"

REM Assume failure initially
set "FINAL_PATH=eee"

REM Check if the temporary file was created and read successfully
if exist "%YAZI_CWD_FILE%" (
    set /p TARGET_CWD=<"%YAZI_CWD_FILE%"
    if defined TARGET_CWD (
        if not "%TARGET_CWD%"=="" (
            REM Use /I for case-insensitive comparison
            if /i not "%TARGET_CWD%"=="%CD%" (
                REM Conditions met! Set the path to be outputted.
                set "FINAL_PATH=%TARGET_CWD%"
            )
        )
    )
)

:cleanup

REM Delete the temporary file if it still exists
if exist "%YAZI_CWD_FILE%" (
    type "%YAZI_CWD_FILE%" 
    set FINAL_PATH=<"%YAZI_CWD_FILE%"
    del /f /q "%YAZI_CWD_FILE%" > nul 2>&1
)

if defined FINAL_PATH (
    echo %FINAL_PATH%
)

endlocal
