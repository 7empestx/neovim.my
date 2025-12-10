# Dotfiles

My development environment configuration for Neovim, tmux, and zsh.

## Hardware

- **MacBook Pro 16-Inch, 2023** - Apple M2 Max, 64 GB RAM

## Quick Start

```bash
# Clone the repo
git clone https://github.com/7empestx/neovim.my.git ~/.config/nvim

# Symlink configs
ln -sf ~/.config/nvim/.zshrc ~/.zshrc
ln -sf ~/.config/nvim/tmux.conf ~/.config/tmux/tmux.conf

# Create secrets file (not tracked)
touch ~/.secrets
# Add your API keys to ~/.secrets

# Install Neovim plugins
nvim +PackerSync
```

## Terminal Stack

| Tool | Purpose |
|------|---------|
| [Ghostty](https://ghostty.org/) | Terminal emulator |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [Oh My Zsh](https://ohmyz.sh/) | Zsh framework |
| [Neovim](https://neovim.io/) | Editor |

## Neovim

### Plugins (Packer)

**Core:**
- telescope.nvim - Fuzzy finder
- nvim-treesitter - Syntax highlighting
- harpoon - File bookmarks
- undotree - Undo history visualization
- vim-fugitive - Git integration
- gitsigns.nvim - Git signs in gutter

**LSP & Completion:**
- nvim-lspconfig + mason.nvim - Language servers
- nvim-cmp + cmp-nvim-lsp - Autocompletion
- LuaSnip - Snippets

**UI:**
- tokyonight.nvim - Color scheme
- lualine.nvim - Status line
- nvim-cursorline - Cursor line highlighting
- indent-blankline.nvim - Indent guides
- trouble.nvim - Diagnostics list

**Productivity:**
- copilot.vim - AI completions
- vim-tmux-navigator - Seamless tmux/vim navigation
- vim-closer - Auto-close brackets

### Key Mappings

Leader: `Space`

| Key | Action |
|-----|--------|
| `<leader>fj` | File explorer (netrw) |
| `<leader>ff` | Format buffer |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>y` | Yank to clipboard |
| `<leader>p` | Paste from clipboard |
| `<leader>s` | Search/replace word |
| `<leader>xx` | Toggle trouble |
| `<C-d>/<C-u>` | Scroll (centered) |
| `J/K` (visual) | Move selection |

## tmux

Prefix: `Ctrl+Space`

| Key | Action |
|-----|--------|
| `prefix + h/j/k/l` | Navigate panes |
| `Shift + Left/Right` | Switch windows |
| `Alt + H/L` | Switch windows |
| `prefix + "` | Split horizontal |
| `prefix + %` | Split vertical |

### Plugins (TPM)
- tmux-sensible
- vim-tmux-navigator
- catppuccin-tmux
- tmux-yank

## Zsh

- Auto-starts tmux session "main" (creates or attaches)
- Secrets stored in `~/.secrets` (not tracked)

### Aliases

| Alias | Command |
|-------|---------|
| `n` | `nvim .` |
| `zshconfig` | `nvim ~/.zshrc` |
| `tmuxconfig` | `cd ~/.config/tmux && nvim .` |
| `nvimconfig` | `cd ~/.config/nvim && nvim .` |

## Other Software

- Firefox - Browser
- Docker - Containers
- Postman - API development
- VS Code - Git diffs only
