-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    ts_ls = function()
      require('lspconfig').ts_ls.setup({
        settings = {
          typescript = {
            preferences = {
              includePackageJsonAutoImports = "on"
            }
          },
          javascript = {
            preferences = {
              includePackageJsonAutoImports = "on"
            }
          }
        }
      })
    end,
  }
})

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
  end,
})

-- Autocompletion
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
