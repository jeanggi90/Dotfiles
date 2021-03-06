export PATH=$HOME/bin:/usr/local/bin:/usr/bin/:$PATH
export ZSH=~/.oh-my-zsh
export DOTFILES=~/Dotfiles

ZSH_THEME=""
CASE_SENSITIVE="true"
plugins=(git history-substring-search)

# Source oh-my-zsh, alias and custom theme
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/alias.zsh
source $ZSH/custom/themes/jc.zsh-theme

# History
HIST_STAMPS="mm/dd/yyyy"  # Timestamp in history
HISTSIZE=5000
SAVEHIST=5000

setopt appendhistory autocd extendedglob nomatch notify

bindkey -v

#autoload -Uz compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Custom Export
export eth=~/Documents/Studies/Eth/Semester4/
export amb=${eth}AutonomousMobileRobots/
export cn=${eth}ComputerNetworks/
export dmdb=${eth}DataModellingAndDatabases/
export fmfp=${eth}FormalMethodsAndFunctionalProgramming/
export ws=${eth}WahrscheinlichkeitUndStatistik/

export VISUAL=nvim
export EDITOR=nvim

export TERM=xterm-color

# Required that GPG works on SSH
export GPG_TTY=$(tty)
stty sane

# NPM
NPM_PACKAGES=
export PATH="$PATH:${HOME}/.npm-packages/bin"

# Custom executables
export PATH="$PATH:${HOME}/.local/bin"
