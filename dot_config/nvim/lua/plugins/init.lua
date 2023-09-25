require("paq")({
  "savq/paq-nvim", -- Let paq manage itself.

  -- [[ Common ]]
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  -- [[ LSP ]]
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "simrat39/rust-tools.nvim",

  -- [[ Completion ]]
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-omni",
  "hrsh7th/nvim-cmp",

  -- [[ Snippets ]]
  "dcampos/nvim-snippy",
  "dcampos/cmp-snippy",
  "honza/vim-snippets",

  -- [[ Navigation ]]
  "tpope/vim-vinegar",
  "nvim-telescope/telescope.nvim",
  "airblade/vim-rooter",
  "christoomey/vim-tmux-navigator",

  -- [[ Appearance ]]
  "hoob3rt/lualine.nvim",
  "NLKNguyen/papercolor-theme",
  "lewis6991/gitsigns.nvim",
  "norcalli/nvim-colorizer.lua",
  "folke/zen-mode.nvim",

  -- [[ ? ]]
  "npxbr/glow.nvim",
  "lervag/wiki.vim",
  "ntpeters/vim-better-whitespace",
  { "iamcco/markdown-preview.nvim", run = function() vim.fn['mkdp#util#install']() end },
  "ferrine/md-img-paste.vim",
})

-- Set the colorscheme.
--
vim.cmd("set t_Co=256")
vim.cmd("colorscheme PaperColor")
vim.cmd("set background=light")

-- Plugin configs.
-- require("plugins.nvim-compe")
require("plugins.nvim-cmp")
require("plugins.nvim-colorizer")
require("plugins.nvim-snippy")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.glow")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("plugins.wiki-vim")
require("plugins.markdown-preview")
require("plugins.md-img-paste")
require("plugins.rust-tools")
require("plugins.zen-mode")
