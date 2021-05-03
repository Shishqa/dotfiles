"============================================================================"
call plug#begin('~/.config/nvim/vim-plug')
"============================================================================"
" * Workflow

" >> coc.nvim completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \'coc-python',
            \'coc-highlight',
            \'coc-snippets',
            \'coc-fzf-preview',
            \'coc-cmake'
            \]

" >> FZF 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" >> set repository root
Plug 'airblade/vim-rooter'

" >> better netrw
Plug 'tpope/vim-vinegar'

" >> snippet bundle
Plug 'honza/vim-snippets'

" >> git changes
Plug 'airblade/vim-gitgutter'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" * Colors

" >> papercolor theme (very nice, actually)
Plug 'NLKNguyen/papercolor-theme'

" >> C++ hightlight
Plug 'jackguo380/vim-lsp-cxx-highlight'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" * Third Party

" build cmake from vim
Plug 'cdelledonne/vim-cmake'

" better commentary
Plug 'tpope/vim-commentary'

" LaTeX in vim
Plug 'lervag/vimtex'

" Markdown in vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-marp'

Plug 'fatih/vim-go'

"============================================================================"
call plug#end()
"============================================================================"
