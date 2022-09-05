.SILENT:
@:
	-ln -s ${PWD}/src/.zfunc ~/.zfunc && echo "~/.zfunc ✔️"
	-ln -s ${PWD}/.zshrc ~/.zshrc && echo "~/.zshrc ✔️"
