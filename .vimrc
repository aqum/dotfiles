set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'easymotion/vim-easymotion'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'lambdatoast/elm.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'tyru/open-browser-github.vim'
Plugin 'rking/ag.vim'
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'taiansu/nerdtree-ag'
Plugin 'ap/vim-css-color'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colors
syntax enable
set background=dark
colorscheme solarized

" Lazy redraw
set lazyredraw
"
" visual autocomplete for command menu
set wildmenu

" Wrap by words
set wrap
set linebreak

" Remap leader key
let mapleader = ","

" swap in home dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Folding based on syntax
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=1
" Toggle fold with space
nnoremap <Space> za
vnoremap <Space> za
" Fold syntax for css
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,} foldlevelstart=0 foldnestmax=1

" Indentation at 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

" Relative numbers
set relativenumber
" show absolute number in current line instead of 0
set number

" Nerdtree
map <C-\> :NERDTreeToggle<CR>
nmap \\ :NERDTreeFind<CR>

" Remap window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" Basic two character easymotion
nmap s <Plug>(easymotion-overwin-f2)

" Replace search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" ctrl+p
" search by default also in buffers
let g:ctrlp_cmd = 'CtrlPMixed'
" buffer search only
nmap gb :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = ''
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" vertical line on 80 characters, solid color above 100
let &colorcolumn="80,".join(range(100,999),",")

" force 256 color mode for gnome-terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" align shorthands
nmap <Leader>af :Tabularize /from<CR>
vmap <Leader>af :sort u<CR> <bar> :Tabularize /from<CR>
vmap <Leader>as :sort u<CR> <bar> :Tabularize /:\zs<CR>
vmap <Leader>s :sort u<CR>

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" force initial status
set laststatus=2
" only filename in tabs
let g:airline#extensions#tabline#fnamemod = ':t'

" Buffers
" allow buffers to be hidden when opening new file
set hidden
" new buffer
nmap t :enew<CR>
" close the current buffer and move to the previous one
nmap gq :bp <BAR> bd #<CR>
" move to the next buffer
nmap gt :bnext<CR>
" move to the previous buffer
nmap gT :bprevious<CR>
" close all buffers except current
nmap gQ :w \| %bd \| e#<CR>

" System clipboard paste
nmap <Leader>p "+p
" System clipboard copy
vmap <Leader>y "+y

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Syntastics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_html_checkers = ['']
let g:syntastic_scss_checkers = ['']

" Typescript support
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_single_quote_import = 1

" NERDCommenter
" add space after comment delimeters
let g:NERDSpaceDelims = 1

" HTML syntax for .ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" Autoreload unchanged files
set autoread

" Highlight tabs
set listchars=tab:>·
set list

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag

" set default filetype for markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" restore correct elixir filetype
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir

" search selected text
vnoremap // y/<C-R>"<CR>

" move beetween wrapped lines
map j gj
map k gk

" project specific vimrc
set exrc
set secure

" gui options
set guifont=Hack
" hide scrollbars in macvim
set guioptions-=T
set guioptions-=r
set guioptions-=L

" remove bell sound
set noerrorbells 
set novisualbell

let g:jsx_ext_required = 0
