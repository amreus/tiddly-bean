@echo off
setlocal

set ASSETS=.init.lua index.lua wiki.html

echo Checking for redbean.com...
if not exist redbean.com (
    echo Fetching redbean.com
    curl https://redbean.dev/redbean-latest.com >redbean.com
)
echo OK


echo Checking for wiki.html...
if not exist wiki.html (
    echo Fetching wiki...
    curl https://tiddlywiki.com/empty.html >wiki.html
)
echo OK


echo Checking for zip utility...
zip >nul
if %errorlevel%==9009 (
    echo Fetching zip utility...
    curl https://redbean.dev/zip.com >zip.com
)
echo OK


copy redbean.com wiki.com >nul
zip wiki.com %ASSETS%

