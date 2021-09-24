local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.markdown = {
    install_info = {
        url = "https://github.com/ikatyang/tree-sitter-markdown",
        files = {"src/parser.c", "src/scanner.cc"}
    },
    filetype = "markdown",
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {'c', 'lua', 'markdown'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

