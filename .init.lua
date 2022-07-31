-- Configures Cache-Control and Expires header generation for static asset serving.
-- Zero means don't cache.
ProgramCache(0)

WIKI_PATH = "wiki.html"

-- Write the embeded html file to disk, and serve from there.
if GetHostOs() == 'WINDOWS' then
    -- check if file exists
    local wiki, err = Slurp(WIKI_PATH)
    if err then
        if err:name() == "ENOENT" then
            -- write embeded html file to disc
            assert(Barf(WIKI_PATH, Slurp("/zip/empty.html")))
        else
            print("An error occured.\n"..err)
            os.exit()
        end
    end
    -- serve from disc rather than embeded asset
    -- Same as -D
    ProgramDirectory(".")
end

-- Large enough to send entire wiki file
ProgramMaxPayloadSize(2 * GetAssetSize(WIKI_PATH))

LaunchBrowser("")

