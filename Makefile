.PHONY: dev deps

dev:
	hugo server -D

deps:
	git submodule update --remote --merge
