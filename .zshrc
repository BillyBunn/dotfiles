
# Aliases
alias ll='ls -al'
alias -g badge='tput bel'
# For interacting with dotfiles bare git repo
alias dotfiles='/usr/bin/git --git-dir=/Users/billybunn/.dotfiles/ --work-tree=/Users/billybunn'

# Turns on completion system in zsh
autoload -Uz compinit && compinit
# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Notes
# macOS Terminal considers every new shell to be a login shell and an interactive shell.
# So, in Terminal a new zsh will potentially run all configuration files: .zshenv, .zprofile, .zshrc, .zlogin
# For simplicity’s sake, I am just using one file: .zshrc

# https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# Turns on zsh framework for getting information from version control systems
autoload -Uz vcs_info
# Adds vsc_info to precmd
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
# Formats the vcs_info_msg_0_ variable
# Sets the general format string of vcs_info_msg_0 variable
# zstyle ':vcs_info:git:*' formats '%F{240}(%b) %r%f'
zstyle ':vcs_info:git*' formats "%F{240}(%b) %m%u%c%f"
zstyle ':vcs_info:*' enable git
# Turns on command substitution in the prompt
setopt PROMPT_SUBST
# Sets the prompt (with git branch name)
# RPROMPT="\$vcs_info_msg_0_"


# Prompt
# PROMPT='%B%F{magenta}%2~%f%b %# '
# NEWLINE=$'\n'
# PROMPT="Line1${NEWLINE}LINE2"
# "terminal.ansiBrightCyan": "#7fdbca",
# N_OW_CYAN=#7fdbca
NEWLINE=$'\n'
# PROMPT="%B%F{cyan}%~/%f%b \$vcs_info_msg_0_ ${NEWLINE}%B%F{cyan}%(!.#.▶︎)%f%b "
# PROMPT="%B%~/%b \$vcs_info_msg_0_ ${NEWLINE}%B%(!.#.▶︎)%b "

# fix Hyper first line precent sign
# unsetopt PROMPT_SP

# Uses the zsh precmd function hook to set the tab title to the current working directory before each prompt
function precmd () {
    window_title="\\033]0;${PWD##*/}\\007"
    echo -ne "$window_title"
}

export STARSHIP_CONFIG=~/.starship
# use starship prompt
eval "$(starship init zsh)"

# points nvm at /.nvm directory
# https://github.com/nvm-sh/nvm#verify-installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
