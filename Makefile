.SILENT:
@:
	-ln -sh ${PWD}/src/.zfunc ~/.zfunc && echo "~/.zfunc ✔️"
	-ln -s  ${PWD}/.zshrc ~/.zshrc && echo "~/.zshrc ✔️"
	-ln -s  ${PWD}/.zshenv ~/.zshenv && echo "~/.zshenv ✔️"
