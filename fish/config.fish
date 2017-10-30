alias chrome='open -a /Applications/Google\ Chrome.app/'
alias subl='open -a /Applications/Sublime\ Text.app/'

set -x PATH /usr/local/mecab/bin $PATH

set -x PYENV_ROOT $HOME/.pyenv
set -x RBENV_ROOT $HOME/.rbenv
set -x PATH $PYENV_ROOT/bin $RBENV_ROOT/bin $PATH
. (pyenv init - | psub)
. (rbenv init - | psub)

set -x NVM_DIR $HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ]
sh $NVM_DIR/nvm.sh # This loads nvm
