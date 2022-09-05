.SILENT:
@:
	-ln -sh ${PWD}/src/.zfunc		~/.zfunc 	&& echo "~/.zfunc ✔️"
	-ln -s  ${PWD}/src/.zshrc 		~/.zshrc 	&& echo "~/.zshrc ✔️"
	-ln -s  ${PWD}/src/.zshenv		~/.zshenv 	&& echo "~/.zshenv ✔️"
	-ln -s  ${PWD}/src/.p10k.zsh	~/.p10k.zsh && echo "~/.p10k.zsh ✔️"
