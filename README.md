# tiddly-bean

Experiments with a [redbean](https://redbean.dev) TiddlyWiki server

----

These files build a server for single-file [Tiddlywiki](https://tiddlywiki.com).

Type `build` or `make` to create the `wiki.com` executable.


Running `wiki.com` starts the server and opens your default browser to your wiki. 

On Linux and Macs, the wiki is served from and saved to inside the executable - so a self-contained wiki with server. The `-*` flag must be used to enable the self-modifying executable.

On Windows, the embeded wiki file is written to disc as `wiki.html`, and is served and saved to disk. This is because
`redbean` does not currently support updating the wiki file inside the executable on Windows.



Credits to [Rick Dillon](https://rpdillon.net/redbean-tiddlywiki-saver.html) for the original server script, and [coderofsalvation](https://talk.tiddlywiki.org/t/hi-thanks-for-tiddlywiki-redbean-server-implementation/4110) for his server implementation.

