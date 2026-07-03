@echo off

set INSTALLER="%~dp0neoforge-%NEOFORGE_VERSION%-installer.jar"

:JAVA
if not defined CUSTOM_JAVA (
    set CUSTOM_JAVA=java
)

"%CUSTOM_JAVA%" -version 1>nul 2>nul || (
   echo Minecraft 1.21 requires Java 21 - Java not found
   pause
   exit /b 1
)

:NEOFORGE
setlocal
cd /D "%~dp0"
if not exist "libraries" (
    echo Running Neoforge installer.
    "%CUSTOM_JAVA%" -jar %INSTALLER% -installServer
)

if "%INSTALL_ONLY%" == "true" (
    echo INSTALL_ONLY: complete
    goto:EOF
)

for /f tokens^=2-5^ delims^=.-_^" %%j in ('"%CUSTOM_JAVA%" -fullversion 2^>^&1') do set "jver=%%j"
if not %jver% geq 21  (
    echo Minecraft 1.21 requires Java 21 - found Java %jver%
    pause
    exit /b 1
) 

:START
"%CUSTOM_JAVA%" @user_jvm_args.txt @libraries\net\neoforged\neoforge\%NEOFORGE_VERSION%\win_args.txt nogui

if "%AUTO_RESTART%" == "false" ( 
    goto:EOF 
)

echo Restarting automatically in 10 seconds (press Ctrl + C to cancel)
timeout /t 10 /nobreak > NUL
goto:START
