vim.g.wiki_root = '/home/shishqa/docs/notes'

vim.g.wiki_filetypes = {'md'}
vim.g.wiki_link_extension = '.md'
vim.g.wiki_link_target_type = 'md'

vim.g.wiki_export = {
  args = [[ --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' ]],
  from_format = 'markdown',
  ext = 'pdf',
  link_ext_replace = true,
  view = true,
}

vim.g.wiki_write_on_nav = true

vim.g.wiki_wiewer = {
  _ = 'brave'
}
