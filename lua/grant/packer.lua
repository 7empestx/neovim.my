-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
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
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --[[
  use({
    "olimorris/onedarkpro.nvim",
    as = 'onedarkpro',
    config = function()
      vim.cmd('colorscheme onedark')
    end
  })
  --]]

  -- Going to try out tokyonight
  use({
    "folke/tokyonight.nvim",
    config = function()
      -- Configure the tokyonight theme
      require("tokyonight").setup({
        -- Set the theme style
        transparent = true,   -- Enable transparency
        terminal_colors = true, -- Enable terminal colors

        -- Configure styles
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark", -- Sidebar style
          floats = "dark", -- Floating window style
        },

        -- Sidebar configuration
        sidebars = { "qf", "help" },

        -- Additional settings
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })

      -- Activate the tokyonight color scheme
      vim.cmd('colorscheme tokyonight')
    end
  })

  -- Going to also try out noice
  -- Noice is noice but too buggy
  --[[
  use {
    'folke/noice.nvim',
    event = "VimEnter",
    config = function()
      require('noice').setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,       -- use a classic bottom cmdline for search
      command_palette = true,     -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,         -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,     -- add a border to hover docs and signature help
    },
    cmdline = {
      enable = false,              -- enable cmdline mode
      view = "cmdline",            -- the view to use for cmdline 

    }
  }
  --]]

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim', branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use('jose-elias-alvarez/typescript.nvim')
  use('github/copilot.vim')
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
end)
