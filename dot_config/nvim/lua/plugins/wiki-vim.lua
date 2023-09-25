vim.g.wiki_root = '/home/shishqa/docs/notes/notes'

vim.g.wiki_filetypes = {'md', 'txt'}
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

vim.g.wiki_journal = {
  name = "journal",
  root = "/home/shishqa/docs/notes/notes",
  frequency = "daily",
}

vim.g.wiki_templates = {
  {
    match_re = "\\d{4}-\\d{2}-\\d{2}",
    source_filename = "/home/shishqa/docs/notes/templates/daily-note-template.md",
  },
}
