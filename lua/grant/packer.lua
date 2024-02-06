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

  use({
    "olimorris/onedarkpro.nvim",
    as = 'onedarkpro',
    config = function()
      vim.cmd('colorscheme onedark')
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim', branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },     -- Required
      {                                -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },     -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'L3MON4D3/LuaSnip' },         -- Required
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

  -- This is a cool plugin, but I cannot see my cursor when it is enabled
  --[[
  use { 
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup()
    end
  }
  --]]
end)
