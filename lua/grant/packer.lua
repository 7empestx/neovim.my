vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'eandrju/cellular-automaton.nvim'
  use {
    'folke/trouble.nvim',
    requires = {
      "nvim-tree/nvim-web-devicons"
    }

  }

  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Going to try out tokyonight
  use({
    "folke/tokyonight.nvim",
    config = function()
      -- Configure the tokyonight theme
      require("tokyonight").setup({
        -- Set the theme style
        transparent = false,    -- Enable transparency
        terminal_colors = true, -- Enable terminal colors

        -- Configure styles
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark", -- Sidebar style
          floats = "dark",   -- Floating window style
        },

        -- Sidebar configuration
        sidebars = { "qf", "help" },

        -- Additional settings
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,

        on_highlights = function(highlights, colors)
          -- Make line numbers much more visible
          highlights.LineNr = { fg = "#FF00FF" }                    -- Bright magenta (impossible to miss)
          highlights.CursorLineNr = { fg = "#FFFF00", bold = true } -- Bright yellow for current line
        end
      })

      -- Activate the tokyonight color scheme
      vim.cmd('colorscheme tokyonight')
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- LSP Configuration
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  -- Autocompletion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'L3MON4D3/LuaSnip' }

  use('jose-elias-alvarez/typescript.nvim')
  -- Tabby AI coding assistant (self-hosted Copilot alternative)
  --[[
  use {
    'TabbyML/vim-tabby',
    config = function()
      vim.g.tabby_agent_start_command = { "npx", "tabby-agent", "--stdio" }
      vim.g.tabby_inline_completion_trigger = "auto"
      vim.g.tabby_disable_lsp = 1
      vim.g.tabby_no_lsp = 1
    end
  }
  --]]
  use('airblade/vim-gitgutter')

  use {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.2',
    config = function()
      require('distant').setup {
        ['*'] = require('distant.settings').chip_default()
      }
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'yamatsum/nvim-cursorline',
  }
  use { 'ThePrimeagen/vim-be-good' }
  use { 'rstacruz/vim-closer' }
  use { 'christoomey/vim-tmux-navigator' }

  use { "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {
      }
    end
  }
end)
