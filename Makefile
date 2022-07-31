assets = .init.lua index.lua empty.html

.PHONY: build clean

build: wiki.com $(assets)
	zip wiki.com $(assets)

wiki.com: redbean.com zip.com
	copy redbean.com wiki.com

redbean.com:
	curl https://redbean.dev/redbean-latest.com >redbean.com

zip.com:
	curl https://redbean.dev/zip.com >zip.com

empty-5.2.2.html:
	curl https://tiddlywiki.com/empty.html >empty.html

clean:
	del wiki.com \
		wiki.exe \
		zip.com \
		redbean.com \
		err \
		*.log

