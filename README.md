# dotfiles
- Tracking is done with a bare git repository in my `$HOME` folder
  - See instructions in this article: [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
- Several pieces of `.zshrc` come from this guide: [Moving to zsh](https://scriptingosx.com/2019/06/moving-to-zsh/)
- Using [Wes Bos's eslint config](https://github.com/wesbos/eslint-config-wesbos) globally
  - A few rule changes specified in the global [`.eslintrc`](/.eslintrc)

## Setup
### Start from scratch
```sh
# Creates a folder ~/.dotfiles which is a Git bare repository that will track our files.
git init --bare $HOME/.dotfiles

# Creates an alias 'dotfiles' to be used instead of the regular git for interacting with our dotfiles repository.
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Sets a flag (local to the repository) to hide files we are not explicitly tracking yet. 
# This is so that when you type 'dotfiles status' and other commands later, files you are not interested in tracking will not show up as untracked.
dotfiles config --local status.showUntrackedFiles no

# Adds the alias definition to .bashrc and .zshrc.
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

### Install dotfiles onto new system
```sh
# Clones dotfiles into a bare repository in a "dot" folder of your $HOME
git clone --bare  https://github.com/BillyBunn/dotfiles.git $HOME/.dotfiles

# Defines the alias in the current shell scope
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# Backs-up any stock configuration files already in the $HOME folder, so they aren't overwritten by git
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dotfiles.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout

# Sets the flag showUntrackedFiles to no on this specific (local) repository
dotfiles config status.showUntrackedFiles no
```

### Usage
```sh
dotfiles status
dotfiles add .gitconfig
dotfiles commit -m 'Adds gitconfig'
dotfiles push origin master
```
