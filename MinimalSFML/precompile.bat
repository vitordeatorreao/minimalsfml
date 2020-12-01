@echo off

:platform
if /i "%1" == "Win32" (
    set platform=x86
    set bits=32
    goto version
)
if /i "%1" == "x64" (
    set platform=x64
    set bits=64
    goto version
)

echo Platform %1 is not recognized.
exit /b 2

:version
if not "%2" == "" (
    set version=%2
    goto download
)

echo SFML Version argument is empty.
exit /b 2

:download
if not exist ..\External (
    mkdir ..\External
)

if not exist ..\External\SFML-%version%-%platform%.zip (
    powershell -Command "Invoke-WebRequest https://www.sfml-dev.org/files/SFML-%version%-windows-vc15-%bits%-bit.zip -OutFile ..\External\SFML-%version%-%platform%.zip"
)

if not exist ..\External\SFML-%version%-%platform% (
    powershell -Command "Expand-Archive -Force ..\External\SFML-%version%-%platform%.zip ..\External"
    move ..\External\SFML-%version% ..\External\SFML-%version%-%platform%
)

echo Successfully downloaded SFML.
