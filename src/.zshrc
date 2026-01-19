# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'ask'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'yes'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:ux1701'              enable 'yes'
zstyle ':z4h:ssh:nas'                 enable 'yes'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh' '~/.dotfiles'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`.
z4h install MichaelAquilina/zsh-you-should-use || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin ~/.dotfiles/bin ~/.dotfiles/private/bin /opt/homebrew/bin /usr/local/bin $path)
fpath=(~/.dotfiles/.zfunc /Users/main/.docker/completions $fpath)

# Export environment variables.
export GPG_TTY=$(tty)
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Enable bash completions
# autoload -U +X bashcompinit && bashcompinit

# Source additional local files if they exist.
# adds ~200ms of time until first command when shell starts
z4h source ~/.profile
z4h source ~/.dotfiles/src/python
z4h source ~/.dotfiles/src/git
z4h source ~/.dotfiles/src/ruby
z4h source ~/.dotfiles/src/node
z4h source ~/.dotfiles/src/media
z4h source ~/.dotfiles/src/nav
z4h source ~/.dotfiles/src/locale
z4h source ~/.dotfiles/src/pre-commit
z4h source ~/.dotfiles/src/colors
z4h source ~/.dotfiles/src/zsh-functions
z4h source ~/.dotfiles/src/direnv
z4h source ~/.dotfiles/src/rust
z4h source ~/.dotfiles/src/copilot
z4h source ~/.dotfiles/src/docker
z4h source ~/.dotfiles/src/claude
z4h source ~/.dotfiles/private/secrets

# Use additional Git repositories pulled in with `z4h install`.

z4h load   MichaelAquilina/zsh-you-should-use
export YSU_MESSAGE_POSITION="after"
export YSU_MESSAGE_FORMAT="$(tput setaf 3)\n%alias_type found: \`%command\` → \`%alias\`$(tput sgr0)"
export YSU_HARDCORE=0  # disable hardcore mode
unset YSU_HARDCORE # disable hardcore mode

# Define key bindings.
z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
# autoload -Uz zmv

# Define named directories: ~w <=> Windows home directory on WSL.
# [[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home


# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot

# This will automatically press Tab for the second time when the first Tab inserts an unambiguous prefix.
setopt auto_menu


autoload -Uz compinit; compinit
zstyle ':completion:*' menu select


# use colors from pure prompt
# Set the colors.
typeset -gA prompt_pure_colors_default prompt_pure_colors
prompt_pure_colors_default=(
    execution_time       yellow
    git:arrow            cyan
    git:stash            cyan
    git:branch           242
    git:branch:cached    red
    git:action           yellow
    git:dirty            218
    host                 242
    path                 blue
    prompt:error         red
    prompt:success       magenta
    prompt:continuation  242
    suspended_jobs       red
    user                 242
    user:root            default
    virtualenv           242
)
prompt_pure_colors=("${(@kv)prompt_pure_colors_default}")
prompt_pure_set_colors() {
	local color_temp key value
	for key value in ${(kv)prompt_pure_colors}; do
		zstyle -t ":prompt:pure:$key" color "$value"
		case $? in
			1) # The current style is different from the one from zstyle.
				zstyle -s ":prompt:pure:$key" color color_temp
				prompt_pure_colors[$key]=$color_temp ;;
			2) # No style is defined.
				prompt_pure_colors[$key]=$prompt_pure_colors_default[$key] ;;
		esac
	done
}

# pnpm
export PNPM_HOME="/Users/main/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

fpath+=~/.zfunc; autoload -Uz compinit; compinit

# claude code
alias claude="~/.claude/local/claude"
# claude code end

# Added by Antigravity
export PATH="/Users/main/.antigravity/antigravity/bin:$PATH"

# opencode
export PATH=/Users/main/.opencode/bin:$PATH
