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
export PATH="$HOME/Software/git-fuzzy/bin:$PATH"
export PATH="$HOME/go/bin:$PATH" # Go binaries
export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
export PATH="$HOME/.local/bin/scripts:$PATH"

if command -v basher 2>&1 >/dev/null; then
  eval "$(basher init - zsh)"             ##basher5ea843
fi

isMac
if [[ $? -eq 0 ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH" # I don't remember wtf is this!
  export HOMEBREW_NO_AUTO_UPDATE=1
fi


isLinux
if [[ $? -eq 0 ]]; then
  export PATH=$HOME/bin:/usr/local/bin:$PATH
  export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
fi

### VARIABLES ###
export LANG=en_US.UTF-8 # manually set language environment
export NVM_DIR="$HOME/.nvm" # nvm
export EDITOR=nvim
export TERMINAL=wezterm
export MANPAGER='nvim +Man!'
export COREPACK_ENABLE_AUTO_PIN=0 # https://github.com/nodejs/corepack/blob/main/README.md#environment-variables

### Main setting ###
export HISTTIMEFORMAT="[%F %T] " # timestamp format
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
setopt EXTENDED_HISTORY # Add timestamp to history. use `history -E`
setopt INC_APPEND_HISTORY # preserve history between sessions https://www.soberkoder.com/better-zsh-history/


### ALIASES (For a full list of active aliases, run `alias`) ###
alias vim='nvim'
alias k='kubectl'
alias d='docker'
alias glog='git log --graph --oneline'
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gf='git fuzzy'
alias gs='git switch'
alias gps='git push'
alias gpl='git pull'
alias gd='git diff'
alias la='eza --icons -lah'
alias l='eza --icons -lh'
alias v2ray='cd ~/Software/v2ray-core && ./v2ray --config=config.json'
alias sudo='sudo '
alias lgr='la | grep -i'
alias lg='lazygit'
alias ldo='lazydocker'
alias tm='tmux-sessionizer'
alias ys='yazi-sessionizer'
alias mt='(){ mkdir -p $1 && tmux-sessionizer $1 $2 }'
alias bwu='bw unlock --raw | xargs -I % sed -i "s|\(BW_SESSION=\)\(.*\)|\1%|g" ~/.private_env'
alias bws='bw-fzf rbw'
alias openp='(){open 0.0.0.0:$1}'
alias yw='yarn workspace'
alias tp='trash-put'
alias ..='cd ..'

if command bat --version &> /dev/null; then
  alias cat='bat'
fi

isLinux
if [[ $? -eq 0 ]]; then
  alias 'open'='xdg-open'
fi

### KEY BINDING ###
bindkey -e # This makes Ctrl-A and Ctrl-E work as expected

bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward

# These are the same as above, but the cursor will go at the end
# bindkey "^p" up-line-or-search
# bindkey "^n" down-line-or-search

# Case insensitive
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Edit the current prompt in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line # Emacs style
bindkey "^x^e" edit-command-line
bindkey '^xe' edit-command-line

### Startup ###
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf key-bindings
FZF_ALT_C_COMMAND="" source <(fzf --zsh)

if command -v cfonts &> /dev/null; then
  cfonts "here we go again" -f chrome -a center
fi

if [[ -f "$HOME/.private_env" ]]; then
  source ~/.private_env
fi

# Cargo env
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
