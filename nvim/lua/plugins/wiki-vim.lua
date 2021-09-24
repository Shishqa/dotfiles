vim.g.wiki_root = '/mnt/WorkDisk/share/notes'

vim.g.wiki_filetypes = {'md'}
vim.g.wiki_link_extension = '.md'
vim.g.wiki_link_target_type = 'md'

vim.g.wiki_export = {
  args = [[ --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' ]],
  from_format = 'markdown',
  ext = 'pdf',
  link_ext_replace = True,
  view = True,
}

vim.g.wiki_write_on_nav = True

vim.g.wiki_wiewer = {
  _ = 'brave'
}
