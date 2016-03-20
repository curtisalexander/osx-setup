#!/usr/bin/env bash

############
# homebrew #
############
if [ ! "$(which brew)" ]; then
    echo
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Updating PATH...\n"
    PATH="/usr/local/bin:$PATH"
else
    echo
    echo "Homebrew is already installed"
fi

#################
# homebrew apps #
#################
echo
echo "Installing Homebrew command line apps"
brew install bash
brew install ccat
brew install git
brew install jq
brew install openssl --force
brew install pandoc
brew install pigz
brew install readline
brew install terminal-notifier
brew install the_silver_searcher
brew install tree
brew install tmux
brew install reattach-to-user-namespace  # used within tmux
brew install vim
brew install zsh --without-etcdir

#################
# homebrew cask #
#################
echo
echo "Installing Homebrew Cask"
brew tap caskroom/cask

echo
echo "Installing Homebrew Cask GUI apps"
brew cask install 1password
brew cask install alfred
brew cask install google-chrome
brew cask install dropbox
brew cask install iterm2
brew cask install caskroom/fonts/font-hack

#########
# Xcode #
#########
if [ "$(xcode-select -p)" ]; then
    echo
    echo "Xcode command line tools are already installed"
else
    echo
    echo "Installing Xcode command line tools"
    xcode-select install
fi

##########
# python #
##########

# install miniconda3
# conda install a few packages

#####
# R #
#####

# install R + RStudio
# git clone radon
# radon install a few packages
