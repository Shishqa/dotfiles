require("paq")({
	"savq/paq-nvim", -- Let paq manage itself.

	-- [[ Common ]]
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",

	-- [[ LSP ]]
	"neovim/nvim-lspconfig",

	"hrsh7th/nvim-compe",
	"hrsh7th/vim-vsnip",
	"nvim-treesitter/nvim-treesitter",
	"simrat39/rust-tools.nvim",
--
	-- [[ Navigation ]]
	"tpope/vim-vinegar",
	"nvim-telescope/telescope.nvim",

	-- [[ Appearance ]]
	"hoob3rt/lualine.nvim",
	"NLKNguyen/papercolor-theme",
	"lewis6991/gitsigns.nvim",
	"norcalli/nvim-colorizer.lua",
	"folke/zen-mode.nvim",

	-- [[ ? ]]
	--'jghauser/follow-md-links.nvim';
	"jbyuki/venn.nvim",
	"npxbr/glow.nvim",
	"lervag/wiki.vim",
	"ntpeters/vim-better-whitespace",
  { "iamcco/markdown-preview.nvim", run = function() vim.fn['mkdp#util#install']() end },

	"ferrine/md-img-paste.vim",
	-- Should try:
	-- https://github.com/ekickx/clipboard-image.nvim
	-- jbyuki/venn.nvim
})

-- Set the colorscheme.
--
vim.cmd("set t_Co=256")
vim.cmd("colorscheme PaperColor")
vim.cmd("set background=light")

-- Plugin configs.
require("plugins.nvim-compe")
require("plugins.nvim-colorizer")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("plugins.wiki-vim")
require("plugins.markdown-preview")
require("plugins.md-img-paste")
require("plugins.rust-tools")
require("plugins.zen-mode")
