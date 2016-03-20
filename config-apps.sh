#!/usr/bin/env bash

##########
# shells #
##########
# zsh available as a shell
if grep -qs '/usr/local/bin/zsh' /etc/shells; then
    echo
    echo "zsh already added to /etc/shells"
else
    echo
    echo "adding /usr/local/bin/zsh to /etc/shells"
    sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

# updated bash available as a shell
if grep -qs '/usr/local/bin/bash' /etc/shells; then
    echo
    echo "bash already added to /etc/shells"
else
    echo
    echo "adding /usr/local/bin/bash to /etc/shells"
    sudo bash -c "echo '/usr/local/bin/bash' >> /etc/shells"
fi

# zsh as default shell
chsh -s /usr/local/bin/zsh

############
# dotfiles #
############
if [ -z "$DOTFILES_DIR" ]; then
    echo
    echo "skipping setting up dotfiles as \$DOTFILES_DIR is empty"
    echo "please update in settings.sh"
else
    echo
    echo "installing dotfiles"
    #git clone https://github.com/curtisalexander/dotfiles.git ${DOTFILES_DIR}
fi
