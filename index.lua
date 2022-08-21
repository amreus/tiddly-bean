-- Adapted from
--   https://rpdillon.net/redbean-tiddlywiki-saver.html
-- and
--   https://gist.github.com/coderofsalvation/f9e22cef04222bca03f7bc342b2a0a2c

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
    SetHeader("Allow", "GET,HEAD,OPTIONS,PUT,DAV")
    SetHeader("dav", "1")   
elseif method == "PUT" then
    if GetHostOs() == "WINDOWS" then
        local ok, err = Barf(WIKI_PATH, GetBody())
        if err then printf("could not save wiki:", err) end
    else
        StoreAsset(WIKI_PATH, GetBody())
    end
    SetStatus(204, "No Content")
end

