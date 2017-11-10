#!/bin/sh
pip_list="../config/pip.txt"
pip3_list="../config/pip3.txt"
python_version="2.7.13"
python3_version="3.6.1"
ruby_version="2.4.1"

echo "Git config"
git config --global user.name "Mizuki Sango"
git config --global user.email msageha@yahoo.co.jp

echo "Install pyenv"
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update

echo "Install python"
pyenv install ${python_version}
echo "Install python3"
pyenv install ${python3_version}
pyenv global ${python_version} ${python3_version}

echo "Starting pip install"
cat ${pip_list} | while read line
do
  brew install ${line}
done

echo "Starting pip3 install"
cat ${pip3_list} | while read line
do
  brew install ${line}
done

echo "install rbenv"
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo "Install ruby"
rbenv install ${ruby_version}

#後から設定しないといけないもの
git clone https://github.com/dracula/iterm.git ../