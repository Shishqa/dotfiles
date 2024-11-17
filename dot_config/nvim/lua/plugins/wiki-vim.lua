local repository_root = '/home/shishqa/notes'

vim.g.wiki_root = repository_root

vim.g.wiki_filetypes = { 'md', 'txt' }
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
  _ = 'yandex-browser-stable'
}

vim.g.wiki_journal = {
  name = "journal",
  root = vim.g.wiki_root,
  frequency = "daily",
}

vim.g.wiki_templates = {
  {
    match_re = "^\\d\\d\\d\\d-\\d\\d-\\d\\d$",
    source_filename = repository_root .. "/templates/daily-note-template.md",
  },
}

vim.cmd [[
function! WikiTomorrow(ctx, text) abort
  let dt = strptime('%Y-%m-%d', a:text)
  return strftime('%Y-%m-%d', dt + 24 * 60 * 60)
endfunction

function! WikiYesterday(ctx, text) abort
  let dt = strptime('%Y-%m-%d', a:text)
  return strftime('%Y-%m-%d', dt - 24 * 60 * 60)
endfunction
]]



-- vim.api.nvim_create_user_command('WikiTomorrow',
--   function(opts)
--     local ctx = opts.fargs[1]
--     local date_str = opts.fargs[2]
--     local year, month, day = date_str:match()
--     local date = os.time({ year = year, month = month, day = day })
--     local tomorrow = os.date("%Y-%m-%d", date + 24 * 60 * 60)
--     print(tomorrow)
--   end,
--   { nargs = '+' }
-- )

vim.api.nvim_create_user_command('WikiYesterday',
  function(opts)
    local ctx = opts.fargs[1]
    local date_str = opts.fargs[2]
    local year, month, day = date_str:match('(%d+)%-(%d+)%-(%d+)')
    local date = os.time({ year = year, month = month, day = day })
    local yesterday = os.date("%Y-%m-%d", date - 24 * 60 * 60)
    print(yesterday)
  end,
  { nargs = '+' }
)
