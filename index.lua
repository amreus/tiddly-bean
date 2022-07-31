method = GetMethod()
WIKI_PATH="wiki.html"

if method == "GET" then
   ServeAsset(WIKI_PATH)
elseif method == "HEAD" then
   wiki = LoadAsset(WIKI_PATH)
   SetStatus(200)
   SetHeader("Content-Type", "text/html")
   SetHeader("Content-Length", tostring(#wiki))
elseif method == "OPTIONS" then
   SetStatus(200)
   SetHeader("allow", "GET,HEAD,POST,OPTIONS,CONNECT,PUT,DAV,dav")
   SetHeader("x-api-access-type", "file")
   SetHeader("dav", "tw5/put")   
elseif method == "PUT" then
   length = tonumber(GetHeader("Content-Length"))
   body = GetBody()
   StoreAsset(WIKI_PATH, body)
   SetStatus(200)
end