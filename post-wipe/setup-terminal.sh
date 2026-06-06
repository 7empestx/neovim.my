#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$ROOT_DIR/Brewfile-terminal"

echo "Installing terminal-focused Homebrew packages..."
/opt/homebrew/bin/brew bundle --file="$BREWFILE"

echo "Creating config directories..."
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"

echo "Cloning Neovim config..."
if [[ ! -d "$HOME/.config/nvim/.git" ]]; then
  git clone https://github.com/7empestx/neovim.my.git "$HOME/.config/nvim"
else
  git -C "$HOME/.config/nvim" pull --ff-only
fi

echo "Writing tmux config..."
cat > "$HOME/.config/tmux/tmux.conf" <<'EOF'
# ==========================
# Terminal & Display
# ==========================
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:RGB"
set -ga terminal-overrides ",xterm-ghostty:RGB"
set -g mouse on

# ==========================
# Prefix Key
# ==========================
unbind C-b
set -g prefix C-Space
bind C-Space send-prefix

# ==========================
# Windows & Panes
# ==========================
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

bind -n S-Left  previous-window
bind -n S-Right next-window

bind -n M-H previous-window
bind -n M-L next-window

bind-key -r '<' swap-window -t -1\; select-window -t -1
bind-key -r '>' swap-window -t +1\; select-window -t +1

bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# ==========================
# Vi Mode & Copy
# ==========================
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# ==========================
# Appearance
# ==========================
set -g @catppuccin_flavour 'mocha'
set -g pane-border-style "fg=colour8"
set -g pane-active-border-style "fg=brightgreen,bold"

# ==========================
# Plugins
# ==========================
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-save-interval '15'
set -g @continuum-restore 'on'

run '~/.tmux/plugins/tpm/tpm'
EOF

echo "Installing tmux plugin manager..."
if [[ ! -d "$HOME/.tmux/plugins/tpm/.git" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Writing Ghostty config..."
cat > "$HOME/Library/Application Support/com.mitchellh.ghostty/config" <<'EOF'
font-size = 16
command = /bin/zsh
theme = TokyoNight Storm
EOF

echo "Linking shell config from Neovim repo..."
ln -sf "$HOME/.config/nvim/.zshrc" "$HOME/.zshrc"

echo "Creating secrets file if missing..."
touch "$HOME/.secrets"
chmod 600 "$HOME/.secrets"

echo
echo "Next steps:"
echo "1. Restore your SSH private key and chmod 600 it."
echo "2. Set your ~/.gitconfig email to your personal address."
echo "3. Open tmux and press prefix + I to install tmux plugins."
echo "4. Open nvim and let lazy.nvim install plugins."
