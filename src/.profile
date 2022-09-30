export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

MYSHELL=`ps -p $$ | grep -o "\w*$" | tail -n1`
echo $MYSHELL
