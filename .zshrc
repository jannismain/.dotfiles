# If you come from bash you might have to change your $PATH.
export HOMEBREW=/usr/local
export PATH=$HOME/bin:$HOME/dev/helpers:/usr/local/bin:$HOME/dev/japi2websocket:$HOMEBREW/bin:$HOMEBREW/sbin:$PATH

# Workaround for issues with locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX="true"
export ZSH="/root/.oh-my-zsh"

# Activate antigen (plugin manager)
source $HOMEBREW/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle pip
antigen bundle git
antigen bundle lukechilds/zsh-better-npm-completion
antigen theme refined
antigen apply

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Use case-sensitive completion.
# CASE_SENSITIVE="true"

# Use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# enable command auto-correction.
ENABLE_CORRECTION="true"

# display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  common-aliases
  python
  colored-man-pages
  docker
  docker-compose
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi


source $ZSH/oh-my-zsh.sh

# User configuration

# pyenv
eval "$(pyenv init -)"

# load brewed zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias venv="source env/bin/activate"
alias r="radian"
alias ipython="/usr/local/bin/ipython"
alias d="dirs -v | head -10"
alias 1="cd -"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"

CORRECT_IGNORE_FILE='.*'

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }


function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}

export RPROMPT='$(check_last_exit_code)'

autoload -Uz promptinit; promptinit
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# configure ls
export LSCOLORS=ExFxBxDxCxegedabagacad

# configure pipx
export PATH="$PATH:/Users/mkj/.local/bin"
autoload -U bashcompinit
bashcompinit	
eval "$(register-python-argcomplete pipx)"

