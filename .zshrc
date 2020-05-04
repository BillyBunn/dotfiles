# echo 'in .zshrc'

# /etc/zshrc & .zshrc are run in interactive shells and login shells by zsh

# macOS Terminal considers every new shell to be a login shell and an interactive shell. 
# So, in Terminal a new zsh will potentially run all configuration files: .zshenv, .zprofile, .zshrc, .zlogin
# For simplicity’s sake, I am just using one file: .zshrc

# prompt
# PROMPT='%B%F{magenta}%2~%f%b %# '
PROMPT='%B%F{magenta}%2~%f%b %(!.#.>) '

# turns on the more powerful completion system in zsh
autoload -Uz compinit && compinit

# aliases
alias ll='ls -al'
alias -g badge='tput bel'

# Alias for interacting with dotfiles bare git repo
alias dotfiles='/usr/bin/git --git-dir=/Users/billybunn/.dotfiles/ --work-tree=/Users/billybunn'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix


# The following lines were added by compinstall

# zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# zstyle :compinstall filename '/Users/billybunn/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

