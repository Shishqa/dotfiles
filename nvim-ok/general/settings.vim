"=========================================================================="

set termguicolors
set background=dark
colorscheme PaperColor

"=========================================================================="

set history=500

set viminfo=%,<800,'10,/50,:100,h,f0,n~/.config/nvim/cache/.viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

syntax on

set re=1

set mouse=a

set so=7
set wildmenu
set ruler
set number
set cmdheight=1                " Height of the command bar
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set updatetime=300             " Making things faster
set shortmess+=c               " Don't pass messages to |ins-completion-menu|.
set smartcase                  " When searching try to be smart about cases
set ignorecase                 " Ignore case when searching
set hlsearch                   " Highlight search results
set incsearch                  " Makes search act like search in modern browsers
set lazyredraw                 " Don't redraw while executing macros 
set magic                      " For regular expressions turn magic on
set showmatch                  " Show matching brackets 
set mat=2                      " How many tenths of a second to blink 
                               " when matching brackets

set expandtab                  " Use spaces instead of tabs
set smarttab                   " Be smart when using tabs ;)

" open new split panes to right and below
set splitright
set splitbelow


filetype plugin indent on
set ai                         " Auto indent
set si                         " Smart indent

set wrap                       " Wrap lines

set encoding=utf8
set ffs=unix

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

set laststatus=2               " Always show the status line

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"=========================================================================="
