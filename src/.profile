export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export MYSHELL=`ps -p $$ | grep -o "\/\w*\w" | tail -n1 | tr -d "/"`
