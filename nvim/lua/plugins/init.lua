require 'paq' {
  'savq/paq-nvim';  -- Let paq manage itself.

  -- [[ Common ]]
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';

  -- [[ LSP ]]
  'neovim/nvim-lspconfig';
  'hrsh7th/nvim-compe';
  'hrsh7th/vim-vsnip';
  'nvim-treesitter/nvim-treesitter';

  -- [[ Navigation ]]
  'tpope/vim-vinegar';
  'akinsho/nvim-toggleterm.lua';
  'nvim-telescope/telescope.nvim';

  -- [[ Appearance ]]
  'hoob3rt/lualine.nvim';
  'NLKNguyen/papercolor-theme';
  'lewis6991/gitsigns.nvim';

  -- [[ ? ]]
  --'jghauser/follow-md-links.nvim';
  'jbyuki/venn.nvim';
  'npxbr/glow.nvim';
  'lervag/wiki.vim';
  'ntpeters/vim-better-whitespace';

  'iamcco/markdown-preview.nvim';
  'ferrine/md-img-paste.vim';
  -- Should try:
  -- https://github.com/ekickx/clipboard-image.nvim
  -- jbyuki/venn.nvim
}

-- Set the colorscheme.
--
vim.cmd 'set t_Co=256'
vim.cmd 'colorscheme PaperColor'
vim.cmd 'set background=light'

-- Plugin configs.
require 'plugins.nvim-toggleterm'
require 'plugins.nvim-compe'
require 'plugins.lualine'
require 'plugins.gitsigns'
require 'plugins.telescope'
require 'plugins.nvim-treesitter'
require 'plugins.wiki-vim'
require 'plugins.markdown-preview'
require 'plugins.md-img-paste'
