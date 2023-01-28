@echo off
setlocal


curl -s https://redbean.dev/latest.txt >redbean-latest.txt
set /p version=<redbean-latest.txt

if defined version (
    echo Found the latest version of redbean: %version%
) else (
    echo Could not find the latest version info for redbean.
    exit /b
)


set redbean=redbean-tiny-%version%.com
set ASSETS=.args .init.lua index.lua
set WIKI=wiki.html

if not exist %redbean% (
    echo Attemping to download %redbean%
    curl -s https://redbean.dev/%redbean% > %redbean%
    if not exist %redbean% (
        echo     [31mFailed.[0m
        exit /b
    ) else (
        echo     [32mSuccess[0m
    )
) else (
    echo Found %redbean%
)
echo.

if not exist %WIKI% (
    echo Trying to download TiddlyWiki empty.html
    curl -s https://tiddlywiki.com/empty.html >%WIKI%
    if not exist %WIKI% (
        echo     [31mFailed.[0m
        exit /b
    ) else (
        echo     [32mSuccess[0m
    )
) else (
    echo Found %WIKI%
)
echo.

zip >nul
if %errorlevel% neq 0 (
    echo Did not find a zip command. Attempting to download
    curl -s https://redbean.dev/zip.com >zip.com
    if exist zip.com (
        echo     [32mSuccess[0m
    ) else (
        echo     [32mSuccess[0m
    )
) else (
    echo Found a zip command
)

echo.

echo Creating wiki.com
copy %redbean% wiki.com >nul

zip wiki.com %ASSETS% %WIKI%

rem echo ERRORLEVEL: %ERRORLEVEL%
