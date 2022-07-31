assets = .init.lua index.lua wiki.html

.PHONY: build clean

build: wiki.com $(assets)
	zip wiki.com $(assets)

wiki.com: redbean.com zip.com
	copy redbean.com wiki.com

redbean.com:
	curl https://redbean.dev/redbean-latest.com >redbean.com

zip.com:
	curl https://redbean.dev/zip.com >zip.com

wiki.html:
	curl https://tiddlywiki.com/empty.html >wiki.html

clean:
	del wiki.com \
		wiki.exe \
		zip.com \
		redbean.com \
		err \
		*.log

