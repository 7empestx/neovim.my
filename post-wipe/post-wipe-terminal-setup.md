# Post-Wipe Terminal Setup

This is the lean rebuild path for your terminal environment. It intentionally skips Flutter, PHP, and broader app restore.

## What this restores

- Homebrew CLI tools you actually use in terminal
- Ghostty
- tmux config
- zsh config
- Neovim config from `7empestx/neovim.my`
- core Git/GitHub/AWS/Node tooling

## Files

- `Brewfile-terminal`
- `setup-terminal.sh`

## Reinstall order

1. Install Homebrew.
2. Clone or open this backup folder.
3. Run:

```bash
chmod +x ./setup-terminal.sh
./setup-terminal.sh
```

4. Restore private files from backup:
   - `~/.ssh/id_ed25519`
   - `~/.secrets`
5. Fix permissions:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 600 ~/.secrets
```

6. Start `tmux`, then install plugins with `Ctrl+Space` then `Shift+I`.
7. Start `nvim` and let `lazy.nvim` install plugins.

## Important follow-ups

- Your current global Git email is still `your personal email` in `~/.gitconfig`. Change that after the wipe if this machine is no longer for work use.
- Ghostty is configured, but your preferred font `Iosevka` was not discovered automatically on disk. If Ghostty does not render the way you expect, install that font manually and then add `font-family = Iosevka` back to the config.
- Your `.zshrc` auto-starts `tmux`, loads `oh-my-zsh`, tries to use your default SSH key, and sources `~/.secrets`. That means those two private files are the highest-priority restores for getting back to “feels like my machine.”

## Suggested Codex prompt after wipe

`Set me up for terminal-only work. Use my Brewfile, restore Ghostty, tmux, zsh, Neovim, SSH, and Git, and keep the setup minimal.`
