

" Vim Plug
call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Definição do mapleader
let mapleader = "z"

" Ativa as cores no terminal
if $COLORTERM == 'xterm-256color'
    set t_Co=256
endif

syntax on
set termguicolors
set background=dark
colorscheme dracula

set encoding=utf-8
set hidden " Oculta buffers quando são abandonados
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab 
set number relativenumber
set cursorline
set matchpairs+=<:>
set linebreak
set breakindent

" Configuração do delay do ESC
set timeoutlen=1000 ttimeoutlen=0

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


" Shortcuts

" Abrir TagBar
nmap <A-t> :TagbarToggle<CR>

" Abre e fecha NerdTree
map <leader>n  :NERDTreeToggle<CR>

" Move entre janelas
" Criação de janelas na vertical
nnoremap <C-O> :vsplit <CR>
" Criação de janelas na horizontal
nnoremap <C-U> :split <CR>
" Fecha janelas
nnoremap <C-C> <C-W>c 

" Aumenta ou diminui o tamanho das janelas
noremap <silent> <C-S-Right>  <C-w>>
noremap <silent> <C-S-Left> <C-w><
noremap <silent> <C-S-Up> <C-w>+
noremap <silent> <C-S-Down> <C-w>-

" Configuração para Tabs
map <leader>t : tabnew <CR>
map <leader>c : tabclose  <cr>
map <leader>l : tabnext <cr>
map <leader>h : tabprevious <cr>

" Comando para abrir terminal
" nmap <leader>' :term <CR>

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

" Não insere comentario em uma nova linha
set formatoptions-=cro

" Comando para identar arquivo
" map <A-i> mqHmwgg=G`wzt`q :echo 'IDENTAÇÃO REALIZADA' <CR>


" Limpa highlight da busca
nnoremap <F3> :set hlsearch!<CR>

" Comando para recarregar .vimrc
nnoremap <F12> :source % <CR> :echo "VIMRC CARREGADO!" <CR>


" Configuração para indentLine
" Escolhe o caracter da marcação da identação
let g:indentLine_char = '│'

" Configurações COC
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
