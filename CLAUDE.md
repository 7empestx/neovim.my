# Claude Code Guide

This is Grant's dotfiles repository containing Neovim, tmux, and zsh configurations.

## Repository Structure

```
.
├── init.lua              # Entry point, loads lua/grant/
├── lua/grant/
│   ├── init.lua          # Loads packer, remap, set
│   ├── packer.lua        # Plugin definitions
│   ├── remap.lua         # Key mappings
│   ├── set.lua           # Vim options
│   └── python.lua        # Python-specific config
├── after/plugin/         # Plugin-specific configs (loaded after plugins)
│   ├── colors.lua
│   ├── telescope.lua
│   ├── harpoon.lua
│   ├── lsp.lua
│   ├── treesitter.lua
│   └── ...
├── .zshrc                # Zsh configuration (sanitized, secrets in ~/.secrets)
├── tmux.conf             # Tmux configuration
└── .p10k.zsh             # Powerlevel10k prompt config
```

## Key Conventions

- **Leader key**: Space
- **Plugin manager**: Packer (`lua/grant/packer.lua`)
- **Theme**: Tokyo Night
- **LSP**: Mason + lspconfig
- **Completion**: nvim-cmp with cmp-nvim-lsp

## Important Key Mappings

| Mapping | Mode | Action |
|---------|------|--------|
| `<leader>fj` | n | Open netrw file explorer |
| `<leader>ff` | n | Format buffer (LSP) |
| `<leader>w` | n | Save file |
| `<leader>q` | n | Quit |
| `<leader>y` | n,v | Yank to system clipboard |
| `<leader>p` | n,v | Paste from system clipboard |
| `<leader>s` | n | Search and replace word under cursor |
| `<C-d>/<C-u>` | n | Scroll down/up (centered) |
| `J/K` | v | Move selection down/up |

## Tmux

- **Prefix**: `Ctrl+Space` (not default `Ctrl+b`)
- **Pane navigation**: `prefix + h/j/k/l` (vim-style)
- **Window switching**: `Shift+Left/Right` or `Alt+H/L`
- **Plugins**: TPM, tmux-sensible, vim-tmux-navigator, catppuccin theme

## Zsh

- Uses Oh My Zsh with zsh-autosuggestions plugin
- Auto-starts tmux session named "main" (attaches if exists)
- Secrets stored in `~/.secrets` (not tracked)
- Key aliases: `n` (nvim .), `zshconfig`, `tmuxconfig`, `nvimconfig`

## When Making Changes

1. **Adding plugins**: Edit `lua/grant/packer.lua`, then `:PackerSync`
2. **Key mappings**: Edit `lua/grant/remap.lua`
3. **Vim options**: Edit `lua/grant/set.lua`
4. **Plugin config**: Add/edit files in `after/plugin/`
5. **Zsh changes**: Edit `.zshrc`, copy to `~/.zshrc`, then `source ~/.zshrc`
6. **Tmux changes**: Edit `tmux.conf`, copy to `~/.config/tmux/tmux.conf`, then `tmux source-file ~/.config/tmux/tmux.conf`

## Files Not Tracked

- `plugin/packer_compiled.lua` - Auto-generated
- `~/.secrets` - Contains API keys and tokens
