#!/usr/bin/env bash

##########
# prezto #
##########
# clone repo, then initialize in a separate script as the script
#   requires zsh specific glob options
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
prezto-init.zsh


#######
# vim #
#######

# vundle

# vundle packages

# vimrc
