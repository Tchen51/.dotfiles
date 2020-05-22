"" plugins
call plug#begin('~/.vim/plugged')

" themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" productivity plugins
Plug 'vimwiki/vimwiki'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { ->mkdp#util#install() }, 'for':['markdown', 'vim-plug']} " markdown preview
Plug 'godlygeek/tabular' " enables md tables
Plug 'vim-pandoc/vim-pandoc' " Visible markdown in vim
Plug 'vim-pandoc/vim-pandoc-syntax' " Visible markdown in vim
Plug 'junegunn/limelight.vim' " paragraph isolation
Plug 'junegunn/goyo.vim' " gui hide for writing prose
Plug 'dense-analysis/ale' " linter, syntax checker

call plug#end()

"" General Setup
filetype plugin on
set nocompatible
syntax enable
set showcmd

set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab

syntax on
""
"" Change escape key
imap <C-L> <Esc>
""

"" leader key

"disables space from moving right
let mapleader=" "
nnoremap <SPACE> <Nop>
"remap space to \
"map <Space> <leader>

augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au insertLeave * set timeoutlen=1000
augroup END

""

"" Vim auto completion
set wildmode=longest,list,full

"" remove trailing white space on save
autocmd BufWritePre * %s/\s\+$//e

"" local spell check enable
let g:pandoc#modules#disabled = ["spell"]
set nospell
map <leader>ss :setlocal spell! spelllang=en_us<CR>
let g:gruvbox_guisp_fallback = 'bg'

"" theming stuff
colorscheme gruvbox
set autoindent
set smartindent
set nowrap
set colorcolumn=80

set number

set laststatus=2
""

"" searching
" issue: currently opens every file with a highlight on vim
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
let @/ = ""
nnoremap <silent> <leader>, :noh<cr>
""

"" mouse
set mouse=a
""

"" copy and pasting stuff
set clipboard=unnamed,unnamedplus
""

"" allow undo even if vim closes
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 undoreload=10000
""


"" VimWiki Stuff
let g:vimwiki_global_ext = 0
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [
   \{'path': '~/Dropbox/VimWiki', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/VimWiki/Vim/vimwiki', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/VimWiki/Vim/vim', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/VimWiki/Hacking', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/VimWiki/Languages/python', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/VimWiki/Languages/markdown', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/VimWiki/Linux/manjaro', 'syntax':'markdown', 'ext': '.md'},
   \{'path': '~/Dropbox/Vimwiki/Misc', 'syntax':'markdown', 'ext': '.md'}]

au BufRead,BufNewFile *.md set filetype=vimwiki
autocmd BufRead,BufNewFIle *.wiki setlocal spell

"date - inserts date in markdown bold and then increments 2 lines
nnoremap <leader>date "=strftime("**%c**") . "\n" . "\n"<CR>gP
inoremap <leader>date <C-R>=strftime("**%c**") . "\n" . "\n"<CR>

" Todo
inoremap <leader>t - [ ]
nnoremap <leader>t <Esc>i- [ ]
""

"" More Shortcuts

nnoremap <leader>md :MarkdownPreview<CR>

""

"" Markdown Preview settings
" does something about that refresh rate
let g:mkdp_refresh_slow=1
""

"" ALE stuff
let g:airline#extensions#ale#enabled = 1
""
