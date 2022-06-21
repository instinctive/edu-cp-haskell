.PHONY: build test clean

build: Solutions.cabal
	@cabal build -j4 -v0

test: build
	@dhall text <<< "(./Solutions).tests" > .tests
	@chmod +x .tests
	@./.tests

clean: Solutions.cabal
	@cabal clean
	@rm Solutions.cabal
	@rm -rf out
	@rm -f .tests
	@rm -f test/*.t

Solutions.cabal: ./Solutions ./etc/Config
	@dhall text <<< "(./Solutions).cabal" > $@
