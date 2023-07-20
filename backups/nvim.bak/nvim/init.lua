vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.guicursor = ""
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.errorbells = false
vim.o.wrap = false
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.colorcolumn = "80"
vim.cmd("syntax on")
vim.o.backspace = "indent,eol,start"
vim.o.foldmethod = "manual"
vim.o.mouse = "a"
vim.o.mousef = true
vim.o.mousehide = true

vim.g.mapleader = " "

-- Insert mode autocommands
vim.cmd([[
augroup vimrc
    autocmd!
    autocmd InsertEnter * silent! set nu
    autocmd InsertLeave * silent! set nonu
    autocmd InsertEnter * silent! set signcolumn=no
    autocmd InsertLeave * silent! set signcolumn=yes
    autocmd InsertEnter * silent! set foldcolumn=0
    autocmd InsertLeave * silent! set foldcolumn=2
augroup END
]])

vim.o.relativenumber = false

local function ColumnHighlights()
    vim.cmd([[
    highlight FoldColumn ctermbg=236 ctermfg=252 guibg=#282828 guifg=#282828
    highlight SignColumn ctermbg=235 ctermfg=252 guibg=#282828 guifg=#282828
    ]])
end

vim.cmd([[
augroup CustomHighlights
    autocmd!
    autocmd ColorScheme * lua ColumnHighlights()
augroup END
]])

ColumnHighlights()

-- Shift lines up or down
vim.api.nvim_set_keymap("n", "_", ":m -2<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "-", ":m +1<cr>", {noremap = true})

-- Ensure packer is installed and added to runtimepath
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- Plugin management with packer.nvim
require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use "Yggdroot/indentLine"
  use "itchyny/lightline.vim"
  use "nvim-lua/plenary.nvim"
  use "justinmk/vim-sneak"
  use "bfrg/vim-cpp-modern"
  use "skamsie/vim-lineletters"
  use "nvim-telescope/telescope.nvim"
  use "gruvbox-community/gruvbox"
  use { "junegunn/fzf", run = "fzf#install()" }
  use "kassio/neoterm"
  use "preservim/nerdtree"
  use "tpope/vim-commentary"
end)

-- LineLetters config
vim.api.nvim_set_keymap("n", ".", "<Plug>LineLetters", {silent = true})
vim.g.lineletters_settings = {
    prefix_chars = {'.', ',', 'j'}
}


-- Fuzzy finder mappings
vim.api.nvim_set_keymap("n", "<F8>", ":FZF<CR>", {})
vim.api.nvim_set_keymap("i", "<F8>", "<c-n>", {})

-- NERDTree mappings
vim.api.nvim_set_keymap("n", "<F4>", ":NERDTreeFind<CR>", {})
vim.api.nvim_set_keymap("n", "<F5>", ":NERDTreeFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<F6>", ":NERDTreeToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<F7>", ":NERDTree<CR>", {})

-- Neoterm mapping
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

vim.cmd("colorscheme gruvbox")

vim.g.lightline = {
    colorscheme = "wombat",
}

-- Sneak mappings
vim.api.nvim_set_keymap("n", ",", "<Plug>Sneak_S", {})
vim.api.nvim_set_keymap("n", "s", "<Plug>Sneak_s", {})













