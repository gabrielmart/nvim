" Vim Plug
call plug#begin()

" Navegação
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utilitarios
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Temas
Plug 'smallwat3r/vim-hashpunk-sw'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax e Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'yggdroot/indentline'

" Lint
Plug 'dense-analysis/ale'

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
colorscheme hashpunk-sw
let g:airline_theme='minimalist'

" Config colors autocomplete/tabBar
hi Pmenu guibg=black
hi PmenuSel ctermbg=gray guibg=#87ff00 guifg=black cterm=bold 
hi PmenuThumb guibg=#87ff00 
hi TabLine guibg=black guifg=#87ff00 gui=bold
hi TabLineSel guibg=#87ff00 guifg=black gui=bold
hi TabLineFill guibg=black gui=bold

set nocompatible
filetype plugin indent on
set encoding=utf-8
set hidden " Oculta buffers quando são abandonados
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab 
set number relativenumber
set cursorline
set matchpairs+=<:>
set guicursor+=n-v-c:blinkon1
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

" Move in wrapping line
nnoremap j gj
nnoremap k gk

" Configuração para não gerar backup ou swapfiles
set nobackup
set nowritebackup
set noswapfile


" Shortcuts

" Abrir TagBar
nmap <A-t> :TagbarToggle<CR>

" Abre e fecha NerdTree
map <leader>n  :NERDTreeToggle<CR>

" FZF
nmap <C-P> :Files<CR>
nmap <C-S-P> :Ag<CR>

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
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Limpa highlight da busca
nnoremap <F3> :set hlsearch!<CR>

" Comando para recarregar .vimrc
nnoremap <F12> :source % <CR> :echo "VIMRC CARREGADO!" <CR>
nnoremap <F10> :split ~/.config/nvim/init.vim <CR> :echo "VIMRC CARREGADO!" <CR>


" Configuração para indentLine
" Escolhe o caracter da marcação da identação
let g:indentLine_char = '│'

" Plugins Config

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

""Use tab e S-tab para navegar nos autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" ALE Config
let g:ale_disable_lsp = 1 
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
    \   'ruby': ['standardrb', 'rubocop'],
    \   'python': ['flake8'],
    \   'javascript': ['eslint']
    \}
