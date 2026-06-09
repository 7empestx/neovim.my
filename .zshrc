# ARM Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Vim mode
bindkey -v
export KEYTIMEOUT=1

# Restore useful keybindings for vim mode
bindkey '^F' autosuggest-accept
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey '^R' history-incremental-search-backward

# Cursor shape for vim mode (block=normal, beam=insert)
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;
    viins|main) echo -ne '\e[5 q';;
  esac
}
zle -N zle-line-init
zle -N zle-keymap-select
echo -ne '\e[5 q'

# Docker Desktop
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# Tools
eval "$(rbenv init -)"

# SSH key (once per session)
if ! ssh-add -l &>/dev/null; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add -q ~/.ssh/chargezoom 2>/dev/null
fi

# Auto-start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main -c ~
fi

# VS Code helper
code() {
  local vscode_path="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
  if [[ -f "$vscode_path" ]]; then
    "$vscode_path" "$@"
  else
    command code "$@" 2>/dev/null || echo "VS Code not found"
  fi
}

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="cd ~/.config/tmux && nvim ."
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias n="nvim ."
alias gitconfig="git config --global --edit"

# Environment
export NAMESPACE=localhost

# Secrets (tokens, API keys)
[[ -f ~/.secrets ]] && source ~/.secrets

# NVM — lazy-load
export NVM_DIR="$HOME/.nvm"
export PATH="$NVM_DIR/versions/node/v22.22.0/bin:$PATH"
lazy_load_nvm() {
  unset -f nvm suitecloud
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm() { lazy_load_nvm && nvm "$@"; }
suitecloud() { lazy_load_nvm && suitecloud "$@"; }

# Herd PHP 8.4
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export PATH="$HOME/Library/Application Support/Herd/bin":$PATH

# Java (OpenJDK 21)
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"


# Herd injected PHP binary.
export PATH="/Users/grant.starkman/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/grant.starkman/Library/Application Support/Herd/config/php/84/"
