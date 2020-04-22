#!/bin/bash

echo "Setup dotfiles"
cd ~/dotfiles
for file in .??*; do
    [ "$file" = ".git" ] && continue
    [ "$file" = ".DS_Store" ] && continue
    ln -snfv ~/dotfiles/"$file" ~/
done

echo "Install HomeBrew"
if ! type "brew" > /dev/null 2>&1 ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew bundle --global

echo "Setup MacOS Preferences"
~/dotfiles/scripts/macos.sh
