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

echo "Initialize for fish"
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

echo "Install for powerline fonts"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# #後から設定しないといけないもの
# git clone https://github.com/dracula/iterm.git ../

