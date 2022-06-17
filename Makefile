.PHONY: build test clean

test: build
	make -C chef/START43 test

build:
	make -C chef/START43 build

clean:
	make -C chef/START43 clean

