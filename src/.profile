# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# python
python=python3

# shell distinction helper
export MYSHELL=`ps -p $$ | tail -n 1 | cut -c 26-`
export MYSHELL_ZSH=`echo $MYSHELL | grep "zsh"`
export MYSHELL_BASH=`echo $MYSHELL | grep "bash"`

# enable bash-completions
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# direnv config
export DIRENV_LOG_FORMAT=
