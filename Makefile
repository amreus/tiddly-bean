.POSIX:
.SUFFIXES:
.PHONY: build clean download update

CAT := $(if $(filter $(OS),Windows_NT),type,cat)
RM := $(if $(filter $(OS),Windows_NT),del,rm)
CP := $(if $(filter $(OS),Windows_NT),copy,cp -p)

name = tiddly-bean.com
assets = .args .init.lua index.lua
wiki = wiki.html


update: wiki.com zip.com $(assets)
	./zip.com wiki.com $(assets)

build: wiki.com zip.com $(assets) $(wiki)
	./zip.com wiki.com $(assets) $(wiki)

wiki.com: redbean.com $(assets) $(wiki)
	$(CP) redbean.com wiki.com
	rem ./zip.com wiki.com $(assets) $(wiki)

redbean.com:
	curl https://redbean.dev/redbean-latest.com >redbean.com
	chmod u+x redbean.com

zip.com:
	curl https://redbean.dev/zip.com >zip.com
	chmod u+x zip.com

$(wiki): empty.html
	$(CP) $< $@

empty.html:
	curl -o $@ https://tiddlywiki.com/empty.html

download:
	curl https://redbean.dev/redbean-tiny-2.0.16.com >redbean.com
	curl https://tiddlywiki.com/empty.html >wiki.html
	curl https://redbean.dev/zip.com >zip.com

clean:
	$(RM) $(wiki) wiki.com redbean.log

reset:
	$(RM) redbean.com wiki.com zip.com $(wiki)

