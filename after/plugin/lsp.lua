-- Mason setup
require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls' }, -- automatically install TypeScript LSP
  automatic_installation = true,
})

local lspconfig = require('lspconfig')

-- TypeScript/JavaScript LSP setup
lspconfig.ts_ls.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
})

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>to', ':TypescriptOrganizeImports<CR>', opts)
    vim.keymap.set('n', '<leader>tr', ':TypescriptRenameFile<CR>', opts)
    vim.keymap.set('n', '<leader>ta', ':TypescriptAddMissingImports<CR>', opts)
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
