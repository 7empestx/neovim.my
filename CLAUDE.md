# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Grant's dotfiles repo: Neovim, tmux, and zsh configs. The repo lives at `~/.config/nvim`,
which is also the live Neovim config directory. The zsh and tmux configs are kept here as
copies and must be **copied out** to their live locations after editing (see "When Making
Changes"). They are not symlinked.

## Neovim Load Order

Understanding the load chain is essential:

1. `init.lua` → `require("grant")`
2. `lua/grant/init.lua` → loads in order: `set` → `lazy` → `remap`
3. `lua/grant/lazy.lua` → bootstraps lazy.nvim and defines all plugins + their inline config
4. `after/plugin/*.lua` → extra plugin tweaks, loaded **after** plugins initialize
   (`harper.lua`, `tipoftheday.lua`)
5. `ftplugin/*.lua` → filetype-specific overrides (e.g., `markdown.lua`)

## Key Conventions

- **Leader key**: Space (set in `set.lua`, before lazy.nvim loads)
- **Plugin manager**: lazy.nvim (`lua/grant/lazy.lua`) — run `:Lazy sync` after changes.
  The lockfile `lazy-lock.json` is tracked in git.
- **Theme**: Tokyo Night Moon (`tokyonight-moon`); custom line-number highlights are set
  inline in the theme block of `lazy.lua` (`on_highlights` + `nvim_set_hl`).
- **LSP**: Mason + mason-lspconfig + lspconfig, all configured inline in `lazy.lua`. Uses the
  `vim.lsp.config` / `vim.lsp.enable` API (not the older `lspconfig.server.setup()` pattern).
  Currently configured for TypeScript (`ts_ls`). Per-buffer LSP keymaps are set in an
  `LspAttach` autocommand.
- **Completion**: nvim-cmp with cmp-nvim-lsp source, LuaSnip for snippets.
- **Copilot**: Uses `copilot.lua` (zbirenbaum), NOT `copilot.vim`. Configured inline in
  `lazy.lua`; `<C-y>` accepts suggestions.
- **Diagnostics**: Virtual text is OFF; uses underline + signs + float (`gl` to open).
- **Indentation**: 2 spaces, no tabs (`set.lua`).
- **Color column**: 80 characters.

## When Making Changes

1. **Adding/removing plugins**: Edit `lua/grant/lazy.lua`, then `:Lazy sync`
2. **Key mappings**: Edit `lua/grant/remap.lua`
3. **Vim options**: Edit `lua/grant/set.lua`
4. **Extra plugin tweaks**: Add/edit files in `after/plugin/`
5. **Filetype overrides**: Add/edit files in `ftplugin/`
6. **LSP servers**: Add to the lspconfig block in `lua/grant/lazy.lua` using the
   `vim.lsp.config` + `vim.lsp.enable` pattern
7. **Zsh changes**: Edit `.zshrc` in this repo, then `cp .zshrc ~/.zshrc && source ~/.zshrc`
   (the live file is `~/.zshrc`)
8. **Tmux changes**: Edit `tmux.conf` in this repo, then
   `cp tmux.conf ~/.config/tmux/tmux.conf && tmux source-file ~/.config/tmux/tmux.conf`
   (the live file is `~/.config/tmux/tmux.conf`; TPM and plugins live in `~/.config/tmux/plugins/`)

## Files Not Tracked

- `~/.secrets` — API keys/tokens, sourced by `.zshrc`

> Note: `.gitignore` still lists `plugin/packer_compiled.lua` and `[packer]`, leftovers from
> the old Packer setup. Harmless, but can be removed since the config now uses lazy.nvim.
