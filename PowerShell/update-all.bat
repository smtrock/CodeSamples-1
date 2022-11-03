@echo off
Echo Upgrade all windows packages
REM Upgrade all windows packages
winget upgrade --accept-source-agreements --accept-source-agreements --include-unknown --all --silent 
if %ERRORLEVEL% EQU 0 Echo Windows app updates installed successfully
REM Upgrade WSL
wsl --user root --exec apt-get update
wsl --user root --exec apt-get upgrade --yes
if %ERRORLEVEL% EQU 0 Echo WSL packages for default distro updated successfully. %ERRORLEVEL%