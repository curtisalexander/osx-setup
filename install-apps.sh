#!/usr/bin/env bash

############
# homebrew #
############
if [ ! "$(command -v brew > /dev/null 2>&1)" ]; then
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
if [ ! "$(command -v conda > /dev/null 2>&1)" ]; then
    # http://conda.pydata.org/docs/help/silent.html
    echo
    echo "Installing miniconda3 (Python 3)"
    wget "$MINICONDA_URL" -O miniconda3_install.sh
    chmod +x miniconda3_install.sh
    bash -b -f miniconda3_install.sh
    rm miniconda3_install.sh
    echo "Update PATH accordingly"
else
    echo
    echo "miniconda3 is already installed"
fi

#####
# R #
#####

# install R
if [ ! "$(command -v R > /dev/null 2>&1)" ]; then
    echo
    echo "Installing R"
    wget "$R_URL" -O R_install.pkg
    chmod +x R_install.pkg
    # install a pkg via installer command
    sudo installer -pkg "R_install.pkg" -target /
    rm R_install.pkg
else
    echo
    echo "R already installed"
fi

# install RStudio
if [ ! -d "/Applications/RStudio.app" ]; then
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
else
    echo 
    echo "RStudio is already installed"
fi
