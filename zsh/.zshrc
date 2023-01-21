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
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk # Android stuff
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator # Android stuff
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools # Android stuff
export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk-16.jdk/Contents/Home/bin # java jdk shit

isLinux
if [[ $? -eq 0 ]]; then
  export PATH=$HOME/bin:/usr/local/bin:$PATH
fi

### VARIABLES ###
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
export LANG=en_US.UTF-8 # manually set language environment
export NVM_DIR="$HOME/.nvm" # nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf

### ohmyzsh setting https://github.com/ohmyzsh/ohmyzsh/wiki/Settings ###
ZSH_THEME="robbyrussell" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# CASE_SENSITIVE="true" # case-sensitive completion.
# HYPHEN_INSENSITIVE="true" # hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable.
# DISABLE_MAGIC_FUNCTIONS="true" # Uncomment if pasting URLs and other text is messed up.
# DISABLE_LS_COLORS="true" #  disable colors in ls.
# DISABLE_AUTO_TITLE="true" # disable auto-setting terminal title.
# ENABLE_CORRECTION="true" # enable command auto-correction.
# DISABLE_UNTRACKED_FILES_DIRTY="true" # disable marking untracked files

plugins=(git)

# source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

### ALIASES (For a full list of active aliases, run `alias`) ###
alias vim='nvim'
alias k='kubectl'

isLinux
if [[ $? -eq 0 ]]; then
  alias 'xdg-open'='open'
fi

### KEY BINDING ###
# TODO: Update this to go at the end of the line after search with this built-in functions: ending-of-line
bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward

cfonts "here we go again" -f chrome -a center

# . /opt/homebrew/etc/profile.d/z.sh || echo "z is not installed"
. /usr/local/etc/profile.d/z.sh || echo "z is not installed"
