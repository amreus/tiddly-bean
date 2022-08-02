-- Configures Cache-Control and Expires header generation for static asset serving.
-- Zero means don't cache.
ProgramCache(0)

WIKI_PATH = "wiki.html"

if GetHostOs() == 'WINDOWS' then
    -- Write the embeded html file to disk.
    local there = path.isfile(WIKI_PATH)
    if not there then
        assert(Barf(WIKI_PATH, Slurp("/zip/wiki.html")))
    end
    -- serve from disc rather than embeded asset. Same as -D
    ProgramDirectory(".")
end

-- Large enough to send entire wiki file
ProgramMaxPayloadSize(2 * GetAssetSize(WIKI_PATH))

LaunchBrowser("")

