-- adapted from https://rpdillon.net/redbean-tiddlywiki-saver.html (StoreAsset didn't work)

method = GetMethod()

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
    if GetHostOs() == "WINDOWS" then
        local ok, err = Barf(WIKI_PATH, GetBody())
        if err then printf("could not save:", err) end
    else
        StoreAsset(WIKI_PATH, GetBody())
    end
    SetStatus(200)
end
