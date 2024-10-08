--  Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--Make sure to setup `mapleader` and `maplocalleader` before
--loading lazy.nvim so that mappings are correct.
--This is also a good place to setup other settings (vim.opt)
--vim.g.mapleader = " "
--vim. Setup lazy.nvimg.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {"folke/tokyonight.nvim"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim", branch = "0.1.x", 
    dependencies = { "nvim-lua/plenary.nvim" }, 
  },
  { "folke/trouble.nvim", cmd = "Trouble" 
},
{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = {"nvim-lua/plenary.nvim"}, },
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
{"nvim-treesitter/nvim-treesitter-context"},
{"theprimeagen/refactoring.nvim"},
{"mbbill/undotree"},
{"tpope/vim-fugitive"},
{"nvim-lua/plenary.nvim"},

{"VonHeikemen/lsp-zero.nvim",
branch = "v1.x",
dependencies = {
  -- LSP Support
  {"neovim/nvim-lspconfig"},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  -- Autocompletion
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"saadparwaiz1/cmp_luasnip"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-nvim-lua"},

  -- Snippets
  {"L3MON4D3/LuaSnip"},
  {"rafamadriz/friendly-snippets"},
},
  },
  {"laytan/cloak.nvim"},
  {
    "iamcco/markdown-preview.nvim",
    dependencies = { "zapling/plantuml.nvim" }, 
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
},

  --  { "jonathanmorris180/salesforce.nvim",
  --  dependencies = {
    --    "nvim-lua/plenary.nvim",
    --    "nvim-treesitter/nvim-treesitter"
    --  },
    --}

    ---- install without yarn or npm
    ----  {"iamcco/markdown-preview.nvim", 
    ----    cmd = "cd app && npm install", 
    ----    setup = function() 
      ----      vim.g.mkdp_filetypes = { "markdown" } end
      ----    , ft = { "markdown" }, 
      ----  },
      ----
      --{"zapling/plantuml.nvim", requires = {"nvim-lua/plenary.nvim"}},
      --use {"leviticusnelson/sfdx.nvim"}
      --  use("folke/zen-mode.nvim")
    }, -- end spec
    --
    checker = { enabled = true },

  })
