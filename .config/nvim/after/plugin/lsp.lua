-- Load lsp-zero module
local lsp = require("lsp-zero")

-- Set up LSP with recommended presets
lsp.preset("recommended")

-- Ensure required LSP servers are installed
lsp.ensure_installed({
  'tsserver',
  'apex_ls',
  'ltex',
  'jsonls',
  'cssls',
  'html',
  'eslint',
  'gopls',
  'rust_analyzer',
})

-- Fix Undefined global 'vim' for Lua Language Server
lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- Specify the path for the Apex language server JAR file
local apex_jar_path = vim.fn.stdpath("config") .. '/lib/' .. 'apex-jorje-lsp.jar'
local lspconfig = require 'lspconfig'

lspconfig.apex_ls.setup {
  apex_jar_path = apex_jar_path,
  apex_enable_semantic_errors = true,
  apex_enable_completion_statistics = false,
  filetypes = {'apex'},
  root_dir = lspconfig.util.root_pattern('sfdx-project.json'),
}

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})


-- Configure completion with cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- Remove default mappings for <Tab> and <S-Tab>
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Set up completion preferences with cmp
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Set general preferences for LSP
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Attach LSP functions to key bindings
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Set up LSP globally
lsp.setup()

-- Configure diagnostic display preferences
vim.diagnostic.config({
    virtual_text = true
})
