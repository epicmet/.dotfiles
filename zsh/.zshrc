### Utils ###
local operating_system=$(uname -s | tr '[:upper:]' '[:lower:]') || "$OSTYPE"

isMac() {    
  if [[ "$operating_system" == "darwin"* ]]; then
    return 0
  fi

  return 1
}

isLinux() {
  if [[ "$operating_system" == "linux"* ]]; then
    return 0
  fi

  return 1
}

############################################################################################

### PATH ###
export PATH=$HOME/.local/bin:$PATH #local bins
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" # Yarn bin
export PATH=$PATH:~/Software/bin:~/.cargo/bin # Rust
export PATH="$HOME/.deno/bin:$PATH" # Deno

isLinux
if [[ $? -eq 0 ]]; then
  export PATH=$HOME/bin:/usr/local/bin:$PATH
fi

### VARIABLES ###
export LANG=en_US.UTF-8 # manually set language environment
export NVM_DIR="$HOME/.nvm" # nvm

### Main setting ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

### ALIASES (For a full list of active aliases, run `alias`) ###
alias vim='nvim'
alias k='kubectl'
alias glog='git log --graph --oneline'
alias gst='git status'
alias l='exa --icons -lFah'
alias v2ray='cd ~/Software/v2ray-core && ./v2ray --config=config.json'
alias sudo='sudo '

isLinux
if [[ $? -eq 0 ]]; then
  alias 'xdg-open'='open'
fi

### KEY BINDING ###
# TODO: Update this to go at the end of the line after search with this built-in functions: ending-of-line
bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward


### Startup ###
eval "$(starship init zsh)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf

cfonts "here we go again" -f chrome -a center

. ~/Software/z/z.sh || echo "z is not installed"
