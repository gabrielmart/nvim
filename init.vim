" Ativa as cores no terminal
if $COLORTERM == 'xterm-256color'
    set t_Co=256
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'name': 'dracula' }

call plug#end()

colorscheme dracula
syntax on
set encoding=utf-8
set hidden " Oculta buffers quando são abandonados
set formatoptions-=cro
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab 
set relativenumber
set cursorline
set matchpairs+=<:>
set linebreak

" Configuração para busca
set ignorecase
set hlsearch
set incsearch
set smartcase

" Configuração para não gerar backup ou swapfiles
set nobackup
set nowritebackup
set noswapfile

let mapleader = "\<space>"

" Shortcuts

" Abrir TagBar
nmap <F8> :TagbarToggle<CR>

" Abre e fecha NerdTree
map <leader>n  :NERDTreeToggle<CR>

" Move entre janelas
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-N> <C-W>n
nnoremap <C-O> :vsplit <CR>
nnoremap <C-C> <C-W>c
noremap <silent> <F7>  <C-w>>
noremap <silent> <F4> <C-w><
noremap <silent> <F6> <C-w>+
noremap <silent> <F5> <C-w>-

" Configuração para Tabs
map <leader>t :tabnew <CR>
map <leader>l :tabnext <cr>
map <leader>h :tabprevious <cr>

" Comando para abrir terminal
nmap <leader>' :term <CR>

" Move uma unica linha
nmap <S-k> [e
nmap <S-j> ]e

" Move multiplas linhas selecionadas
vmap <S-j> ]egv
vmap <S-k> [egv

" Comando para identar arquivo
map <C-I> mqHmwgg=G`wzt`q :echo 'IDENTAÇÃO REALIZADA' <CR>

" Limpa highlight da busca
nnoremap <F3> :set hlsearch!<CR>

" Comando para recarregar .vimrc
nnoremap <F12> :source % <CR> :echo "VIMRC CARREGADO!" <CR>

" [1]
" Configuração para indentLine

" Escolhe o caracter da marcação da identação
let g:indentLine_char = '│'

" Desabilita cor default
let g:indentLine_setColors = 0

" Escolhe uma cor para o caracter da identação
let g:indentLine_color_term = 239


" Configuração COC.nvim
" set updatetime=300
" set shortmess+=c

" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <TAB>
"             \ pumvisible() ? "\<C-n>" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" inoremap <expr> <C-j> pumvisible() ? '<C-n>' : ''
" inoremap <expr> <C-k> pumvisible() ? '<C-p>' : ''
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" map <silent> D :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction

" command! -nargs=0 Format :call CocAction('format')
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" autocmd CursorHold * silent call CocActionAsync('highlight')

" augroup CocGroup
"     autocmd!
"     " Setup formatexpr specified filetype(s).
"     autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"     " Update signature help on jump placeholder
"     autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" nmap <leader>rn <Plug>(coc-rename)
" nmap <leader>ac <Plug>(coc-codeaction)

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings using CoCList:
" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>