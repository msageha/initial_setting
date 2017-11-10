#!/bin/sh
brew_list="../config/brew.txt"
echo "Install Xcode"
xcode-select --install

echo "Install homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade --all

echo "Starting brew install"
cat ${brew_list} | while read line
do
  brew install ${line}
done