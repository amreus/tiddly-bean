assets = .args .init.lua index.lua
wiki = wiki.html

.PHONY: dist clean download update

update: wiki.com zip.com $(assets)
	./zip.com wiki.com $(assets)

dist: wiki.com zip.com $(assets) $(wiki)
	./zip.com wiki.com $(assets) $(wiki)

wiki.com: redbean.com
	cp -p redbean.com wiki.com

redbean.com:
	curl https://redbean.dev/redbean-latest.com >redbean.com
	chmod u+x redbean.com

zip.com:
	curl https://redbean.dev/zip.com >zip.com
	chmod u+x zip.com

wiki.html:
	curl https://tiddlywiki.com/empty.html >wiki.html

download: redbean.com zip.com wiki.html
	curl https://redbean.dev/redbean-tiny-2.0.16.com >redbean.com
	curl https://tiddlywiki.com/empty.html >wiki.html
	curl https://redbean.dev/zip.com >zip.com

clean:
	rm wiki.html redbean.com zip.com

reset:
	rm redbean.com wiki.com zip.com wiki.html

