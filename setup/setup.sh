#!/bin/sh
git_username="Mizuki Sango"
git_email="msageha@yahoo.co.jp"
pip_list="../config/pip.txt"
pip3_list="../config/pip3.txt"
python_version="2.7.13"
python3_version="3.6.4"
ruby_version="2.4.1"

echo "Git config"
git config --global user.name ${git_username}
git config --global user.email ${git_email}

echo "Vim setting"
cp ../vimrc ~/.vimrc
echo "colors"
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim -o ~/.vim/colors/dracula.vim
echo "Install NeoBundle"
mkdir -p ~/.vim/bundle
git clone --depth 1 git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

vim -c NeoBundleInstall! -c qall

echo "Install pyenv"
git clone --depth 1 https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

echo "install rbenv"
git clone --depth 1 https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export RBENV_ROOT="$HOME/.rbenv"' >> ~/.bash_profile
echo 'export PATH="$RBENV/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile

echo "Install python ${python_version}"
pyenv install ${python_version}
echo "Install python ${python3_version}"
pyenv install ${python3_version}
pyenv global ${python_version} ${python3_version}

echo "Starting pip install"
cat ${pip_list} | while read line
do
  pip install ${line}
done

echo "Starting pip3 install"
cat ${pip3_list} | while read line
do
  pip3 install ${line}
done

echo "Install ruby ${ruby_version}"
rbenv install ${ruby_version}
