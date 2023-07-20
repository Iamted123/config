set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set colorcolumn=80
syntax on
set backspace=indent,eol,start
set foldmethod=manual
set mouse=a
set mousef
set mousehide

let mapleader = " "

""" SET NUMBERS ON INSERT   
set signcolumn=yes
set foldcolumn=2

" when insert, change
augroup vimrc
    au InsertEnter * silent! set nu
    au InsertLeave * silent! set nonu
    
    au InsertEnter * silent! set signcolumn=no
    au InsertLeave * silent! set signcolumn=yes
    
    au InsertEnter * silent! set foldcolumn=0
    au InsertLeave * silent! set foldcolumn=2
augroup END


set norelativenumber
"set cursorline

function! ColumnHighlights() abort
  highlight FoldColumn ctermbg=236 ctermfg=252 guibg=#282828 guifg=#282828
  highlight SignColumn ctermbg=235 ctermfg=252 guibg=#282828 guifg=#282828

"  highlight CursorLineNr ctermfg=White guifg=White
endfunction

" re-apply highlights on ColorScheme events
augroup CustomHighlights
  autocmd!
  autocmd ColorScheme * call ColumnHighlights()
augroup END

call ColumnHighlights()

""" SET NUMBERS ON INSERT - END 



" shift line up or down
:nnoremap _ :m -2<cr>
:nnoremap - :m +1<cr>

"nnoremap<buffer> - 
"<Plug>NetrwBrowseUpDir

call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'justinmk/vim-sneak'
Plug 'bfrg/vim-cpp-modern'
Plug 'skamsie/vim-lineletters'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kassio/neoterm'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
call plug#end()


" config for LineLetters
map <silent>. <Plug>LineLetters

let g:lineletters_settings = {
      \ 'prefix_chars': ['.', ',', 'j'],
      \ }

" invoke fuzzy finder
:nnoremap <F8> :FZF<CR>
:inoremap <F8> <c-n>

" invoke NERDTREE
:nnoremap <F4> :NERDTreeFind<cr>
:nnoremap <F5> :NERDTreeFocus<cr>
:nnoremap <F6> :NERDTreeToggle<cr>
:nnoremap <F7> :NERDTree<cr>

" make for neoterm
tnoremap <Esc> <C-\><C-n>


colorscheme gruvbox

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }


map , <Plug>Sneak_S
map s <Plug>Sneak_s
