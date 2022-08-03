# tiddly-bean

Experiments with a [redbean](https://redbean.dev) TiddlyWiki server

----

These files build a server for single-file
[Tiddlywiki](https://tiddlywiki.com).

Type `build` or `make dist` to create the `wiki.com` executable.


Running `wiki.com` starts the server and opens your default browser to your
wiki. 

On Linux and Macs, the wiki is embeded in the executable - so a self-contained
wiki with server.

On Windows, the embeded wiki file is first written to disc as `wiki.html`, and
is saved back to disk. This is because `redbean` does not currently support
updating the wiki file inside the executable on Windows.

To use an existing tiddlywiki, replace the `wiki.html` file in the executable using the `zip` utility.

* First copy the exsiting wiki to `wiki.html`
* Then enter on the command line: `zip wiki.com wiki.html`


Credits to [Rick Dillon](https://rpdillon.net/redbean-tiddlywiki-saver.html)
for the original server script, and
[coderofsalvation](https://talk.tiddlywiki.org/t/hi-thanks-for-tiddlywiki-redbean-server-implementation/4110)
for his server implementation.

