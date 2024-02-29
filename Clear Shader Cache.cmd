@echo off
setlocal

set "dxCachePath=%LOCALAPPDATA%\NVIDIA\DXCache"
set "glCachePath=%LOCALAPPDATA%\NVIDIA\GLCache"
set "steamShaderCachePath=C:\Program Files (x86)\Steam\steamapps\shadercache"
set "iobitUnlockerPath=C:\Program Files (x86)\IObit\IObit Unlocker\IObitUnlocker.exe"

echo Would you like to clear NVIDIA and Steam Shader Cache? (Y/N)
set /p choice=

if /i "%choice%"=="Y" (
    if exist "%dxCachePath%" (
        echo Removing DirectX NVIDIA Shader Cache...
        rd /s /q "%dxCachePath%"
        echo DirectX NVIDIA Shader Cache removed.
    ) else (
        echo The DirectX NVIDIA Shader Cache folder does not exist.
    )

    if exist "%glCachePath%" (
        echo Removing OpenGL NVIDIA Shader Cache...
        rd /s /q "%glCachePath%"
        echo OpenGL NVIDIA Shader Cache removed.
    ) else (
        echo The OpenGL NVIDIA Shader Cache folder does not exist.
    )

    if exist "%steamShaderCachePath%" (
        echo Removing Steam Shader Cache...
        rd /s /q "%steamShaderCachePath%"
        echo Steam Shader Cache removed.
    ) else (
        echo The Steam Shader Cache folder does not exist.
    )

    echo.
    echo Trying to unlock remaining files...
    "%iobitUnlockerPath%" /delete "%dxCachePath%" /s
    "%iobitUnlockerPath%" /delete "%glCachePath%" /s
    "%iobitUnlockerPath%" /delete "%steamShaderCachePath%" /s
    echo.

    echo Shader Caches cleared successfully, press any key to exit...
    pause >nul
) else if /i "%choice%"=="N" (
    echo Operation aborted, press any key to exit...
    pause >nul
    exit /b
) else (
    echo Invalid choice. Please try again.
    pause >nul
)

endlocal
