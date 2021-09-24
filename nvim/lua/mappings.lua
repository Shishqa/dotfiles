local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = "\\"

map('t', '<A-h>', '<C-\\><C-n><C-w>h')
map('t', '<A-j>', '<C-\\><C-n><C-w>j')
map('t', '<A-k>', '<C-\\><C-n><C-w>k')
map('t', '<A-l>', '<C-\\><C-n><C-w>l')
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')
