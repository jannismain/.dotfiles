.SILENT:
@:
	./setup/setup

submodules:
	git submodule update --init --recursive
	cd private && git checkout main
