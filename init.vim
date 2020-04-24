" Ativa as cores no terminal
if $COLORTERM == 'xterm-256color'
    set t_Co=256
endif

call plug#begin()
    Plug 'scrooloose/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'yggdroot/indentline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'andreypopp/vim-colors-plain'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'honza/vim-snippets'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'scrooloose/syntastic'
call plug#end()

let g:airline_theme='minimalist'
set background=dark
colorscheme plain
set termguicolors
syntax on
set formatoptions-=cro
set encoding=utf-8
set hidden " Oculta buffers quando são abandonados
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab 
set relativenumber
set cursorline
set matchpairs+=<:>
set linebreak
set breakindent

" Configuração para busca
set ignorecase
set hlsearch
set incsearch
set smartcase
set autoindent
set smartindent

" Configuração para não gerar backup ou swapfiles
set nobackup
set nowritebackup
set noswapfile

let mapleader = "z"

" Shortcuts

" Abrir TagBar
nmap <A-t> :TagbarToggle<CR>

" Abre e fecha NerdTree
map <leader>n  :NERDTreeToggle<CR>

" Move entre janelas
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-N> <C-W>n
nnoremap <C-O> :vsplit <CR>
nnoremap <C-U> :split <CR>
nnoremap <C-C> <C-W>c
noremap <silent> <A-Right>  <C-w>>
noremap <silent> <A-Left> <C-w><
noremap <silent> <A-Up> <C-w>+
noremap <silent> <A-Down> <C-w>-

" Configuração para Tabs
map <leader>t :tabnew <CR>
map <leader>l :tabnext <cr>
map <leader>h :tabprevious <cr>
map <leader>c :tabclose  <cr>

" Comando para abrir terminal
nmap <leader>' :term <CR>

" Move uma unica linha
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Move linha no mode de inserção
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi

" Move multiplas linhas selecionadas
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Configura a clipboard
set clipboard+=unnamedplus 

" Comando para identar arquivo
map <A-i> mqHmwgg=G`wzt`q :echo 'IDENTAÇÃO REALIZADA' <CR>

" Limpa highlight da busca
nnoremap <F3> :set hlsearch!<CR>

" Comando para recarregar .vimrc
nnoremap <F12> :source % <CR> :echo "VIMRC CARREGADO!" <CR>

" [1]
" Configuração para indentLine
" Escolhe o caracter da marcação da identação
let g:indentLine_char = '│'
