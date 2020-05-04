
# Prompt
# PROMPT='%B%F{magenta}%2~%f%b %# '
PROMPT='%B%F{magenta}%2~%f%b %(!.#.>) '

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
