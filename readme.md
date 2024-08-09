# My Development Environment

I am an avid user of Neovim and prefer a setup that optimizes for efficiency and productivity. Here's a glance at the tools and configurations that make up my development ecosystem.

## Hardware

- **Laptop:** MacBook Pro 16-Inch, 2023 Model
  - **Specs:** Apple M2 Max Chip, 64 GB RAM

## Essential Desktop Software

My daily workflow is supported by a carefully selected suite of desktop software that enhances productivity and streamlines my development process.

- **Terminal Emulator:** iTerm2 (with plans to switch to Alacritty for its GPU acceleration benefits)
- **Web Browser:** Firefox, for its privacy-focused browsing experience
- **Containerization:** Docker, for creating, deploying, and running applications in containers
- **API Development:** Postman, for designing, testing, and sharing APIs
- **Source Control:** Visual Studio Code, exclusively used for handling diffs and source control management

## iTerm2 Configuration

iTerm2 is not just a terminal emulator; it's the centerpiece of my development setup, especially with the following configurations and tools:

- **Neovim:** The heart of my setup for efficient code editing. [Neovim](https://neovim.io/)
- **Package Manager:** Homebrew, for managing software installations on macOS. [Homebrew](https://brew.sh/)
- **Shell Enhancement:** OHMYZSH, for a powerful and customizable zsh configuration. [OHMYZSH](https://ohmyz.sh/)
  - **Plugins:**
    - ZSH-Autosuggestions, for fast and efficient command completion. [ZSH-Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - Git, for enhanced git integration in the terminal.
- **Prompt Customization:** powerlevel10k, for a fast and customizable prompt. [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Enhanced Listing:** Colorls, for adding color and icons to the `ls` command. [Colorls](https://github.com/athityakumar/colorls)
- **Terminal Multiplexer:** Tmux, for managing multiple terminal sessions. [Tmux](https://github.com/tmux/tmux/wiki)
- **Fonts:** Nerd Font (MesloLGS NF), for a comprehensive collection of icons and glyphs. [Nerd Fonts](https://www.nerdfonts.com/)


## Neovim Configuration

All of my Neovim configuration is centrally managed within this repository, providing a streamlined and efficient development environment. Below is a detailed overview of the plugins and themes utilized, managed by Packer, the Neovim plugin manager.

### Plugin Manager

- **Packer:** A powerful Neovim plugin manager that handles installation, configuration, and management of plugins.

### Themes and Aesthetics

- **One Dark Pro Theme:** Utilizes the `onedarkpro` plugin for a visually appealing and comfortable coding experience. The theme is automatically applied upon startup.

### Productivity and Utility Plugins

- **telescope.nvim:** A highly extendable fuzzy finder over lists, allowing for quick file, buffer, and text searching within Neovim.
- **nvim-treesitter:** Improves syntax highlighting and text parsing for a wide range of programming languages.
- **harpoon:** A utility to bookmark files and quickly navigate between them.
- **copilot.vim:** GitHub Copilot integration for AI-powered code completions.
- **cellular-automaton.nvim:** An interesting plugin that adds cellular automaton backgrounds to Neovim.
- **vim-gitgutter:** Displays git diff markers in the sign column and provides git-related functionalities directly within Neovim.

- **trouble.nvim:** An enhanced diagnostics list and error management, integrated with `nvim-web-devicons` for visually distinct icons.
- **undotree:** Visualizes the undo history, making it easier to navigate and recover previous states of editing.
- **vim-fugitive:** A Git wrapper that extends Neovim's capabilities to interact with Git repositories.
- **typescript.nvim:** Enhances TypeScript development within Neovim.

### Development and LSP Configuration

- **lsp-zero.nvim:** Simplifies the setup for Neovim's Language Server Protocol (LSP) functionality, including auto-completion and syntax checking.
  - Dependencies include `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim`, `nvim-cmp`, `cmp-nvim-lsp`, and `LuaSnip` for a comprehensive development setup.

### Additional Enhancements

- **lualine.nvim:** A customizable status line that enhances the visual feedback on the editor's status, integrated with `nvim-web-devicons`.
- **nvim-cursorline:** Highlights the line and column of the cursor, improving visibility and focus.
- **distant.nvim:** Enables remote development, allowing Neovim to interact with files and execute commands on distant machines.
- **vim-be-good:** A Neovim plugin aimed at improving Vim skills through interactive games.
- **vim-closer:** Automatically closes brackets, quotes, and other enclosures, enhancing coding speed and accuracy.
- **vim-tmux-navigator:** Seamlessly navigate between tmux panes and Neovim splits, unifying the user interface.

This configuration emphasizes a balance between aesthetics, functionality, and development efficiency, leveraging the extensibility of Neovim to create a tailored and powerful coding environment.

### Note

This setup emphasizes the importance of Neovim in my workflow and showcases my preference for tools that offer both functionality and efficiency. While I enjoy experimenting with new software, the core of my development environment remains centered around the robust capabilities of iTerm2, enhanced by the flexibility of zsh and the power of Neovim.
