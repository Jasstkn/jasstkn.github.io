.PHONY: dev upd_theme

dev:
	hugo server -D

upd_theme:
	git submodule update --remote --merge
