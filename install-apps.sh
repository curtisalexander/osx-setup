#!/usr/bin/env bash

#########
# Xcode #
#########
if [ "$(xcode-select -p)" ]; then
    echo
    echo "Xcode command line tools are already installed"
else
    echo
    echo "Installing Xcode command line tools"
    xcode-select --install
fi

############
# homebrew #
############
if [ "$(type brew)" ]; then
    echo
    echo "Homebrew is already installed"
else
    echo
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Updating PATH...\n"
    PATH="/usr/local/bin:$PATH"
fi

#################
# homebrew apps #
#################
echo
echo "Installing Homebrew command line apps"
brew install bash
brew install ccat
brew install fzf
brew install git
brew install jq
brew install argon/mas/mas
brew install openssl --force
brew install pandoc
brew install pigz
brew install readline
brew install terminal-notifier
#brew install the_silver_searcher
brew install tree
brew install tmux
brew install reattach-to-user-namespace  # used within tmux
brew install vim
brew install wget
brew install zsh --without-etcdir

#################
# homebrew cask #
#################
echo
echo "Installing Homebrew Cask"
brew tap caskroom/cask

echo
echo "Installing Homebrew Cask GUI apps"
#brew cask install 1password
#brew cask install alfred
brew cask install caffeine
brew cask install caskroom/fonts/font-hack
#brew cask install dropbox
#brew cask install google-chrome
brew cask install iterm2
brew cask install bettertouchtool

##########
# python #
##########

# install miniconda3
if [ "$(type conda)" ]; then
    echo
    echo "miniconda3 is already installed"
else
    # http://conda.pydata.org/docs/help/silent.html
    echo
    echo "Installing miniconda3 (Python 3)"
    wget "$MINICONDA_URL" -O miniconda3_install.sh
    chmod +x miniconda3_install.sh
    bash -b -f miniconda3_install.sh
    rm miniconda3_install.sh
    echo "Update PATH accordingly"
fi

#####
# R #
#####

# install R
if [ "$(type R)" ]; then
    echo
    echo "R already installed"
else
    echo
    echo "Installing R"
    wget "$R_URL" -O R_install.pkg
    chmod +x R_install.pkg
    # install a pkg via installer command
    sudo installer -pkg "R_install.pkg" -target /
    rm R_install.pkg
fi

# install RStudio
if [ -d "/Applications/RStudio.app" ]; then
    echo 
    echo "RStudio is already installed"
else 
    echo
    echo "Installing RStudio"
    wget "$RSTUDIO_URL" -O RStudio_install.dmg
    chmod +x RStudio_install.dmg
    # mount image - mounts to /Volumes/RStudio
    hdiutil attach RStudio_install.dmg -quiet
    # install dmg via a copy
    sudo cp -a "/Volumes/$RSTUDIO_MNT_NAME" "/Applications"  
    # unmount image
    hdiutil detach -force "/Volumes/$RSTUDIO_MNT_NAME"
    rm RStudio_install.dmg
fi
