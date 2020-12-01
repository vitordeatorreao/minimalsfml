@echo off

if /i "%1" == "Debug" (
    set dllsufix=-d
    goto platform
)
if /i "%1" == "Release" (
    set dllsufix=
    goto platform
)

echo Build Configuration %1 is not recognized.
exit /b 2

:platform
if /i "%2" == "Win32" (
    set platform=x86
    goto version
)
if /i "%2" == "x64" (
    set platform=x64
    goto version
)

echo Platform %2 is not recognized.
exit /b 2

:version
if not "%3" == "" (
    set version=%3
    goto copy
)

:copy
if not exist ..\Dist\%2\%1\openal32.dll (
    copy ..\External\SFML-%version%-%platform%\bin\openal32.dll ..\Dist\%2\%1\openal32.dll
)
if not exist ..\Dist\%2\%1\sfml-audio%dllsufix%-2.dll (
    copy ..\External\SFML-%version%-%platform%\bin\sfml-audio%dllsufix%-2.dll ..\Dist\%2\%1\sfml-audio%dllsufix%-2.dll
)
if not exist ..\Dist\%2\%1\sfml-graphics%dllsufix%-2.dll (
    copy ..\External\SFML-%version%-%platform%\bin\sfml-graphics%dllsufix%-2.dll ..\Dist\%2\%1\sfml-graphics%dllsufix%-2.dll
)
if not exist ..\Dist\%2\%1\sfml-network%dllsufix%-2.dll (
    copy ..\External\SFML-%version%-%platform%\bin\sfml-network%dllsufix%-2.dll ..\Dist\%2\%1\sfml-network%dllsufix%-2.dll
)
if not exist ..\Dist\%2\%1\sfml-system%dllsufix%-2.dll (
    copy ..\External\SFML-%version%-%platform%\bin\sfml-system%dllsufix%-2.dll ..\Dist\%2\%1\sfml-system%dllsufix%-2.dll
)
if not exist ..\Dist\%2\%1\sfml-window%dllsufix%-2.dll (
    copy ..\External\SFML-%version%-%platform%\bin\sfml-window%dllsufix%-2.dll ..\Dist\%2\%1\sfml-window%dllsufix%-2.dll
)