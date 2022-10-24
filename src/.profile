# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# shell distinction helper
export MYSHELL=`ps -p $$ | tail -n 1 | cut -c 26-`
export MYSHELL_ZSH=`echo $MYSHELL | grep "zsh"`
export MYSHELL_BASH=`echo $MYSHELL | grep "bash"`

# enable bash-completions
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# util
export PATH="~/bin:$PATH"
