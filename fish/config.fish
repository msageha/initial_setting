alias vsc='open -a /Applications/Visual\ Studio\ Code.app'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias ls='ls -G'

# For pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" "$PATH"
eval (pyenv init - | source)

export PATH
export LESS='-R'

set fish_plugins theme peco

# peco
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
end
