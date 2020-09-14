" Definição do mapleader
let mapleader = "z"


" Vim Plug
call plug#begin()
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
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/syntastic'
call plug#end()

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
nnoremap <C-O> :vsplit <CR>
nnoremap <C-U> :split <CR>
nnoremap <C-C> <C-W>c

nnoremap <C-S-K> <C-W>t <C-W>k

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-N> <C-W>n

noremap <silent> <A-Right>  <C-w>>
noremap <silent> <A-Left> <C-w><
noremap <silent> <A-Up> <C-w>+
noremap <silent> <A-Down> <C-w>-

" Configuração para Tabs
map <leader>t :tabnew <CR>
map <leader>c :tabclose  <cr>
map <leader>l :tabnext <cr>
map <leader>h :tabprevious <cr>

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
