@echo off
setlocal

set ASSETS=.args .init.lua index.lua
set WIKI=wiki.html

if not exist redbean.com (
    curl https://redbean.dev/redbean-latest.com >redbean.com
)

if not exist wiki.html (
    curl https://tiddlywiki.com/empty.html >wiki.html
)

zip >nul
if %errorlevel%==9009 (
    curl https://redbean.dev/zip.com >zip.com
    set ZIP=zip.com
)

copy redbean.com wiki.com >nul
zip wiki.com %ASSETS% %WIKI%

