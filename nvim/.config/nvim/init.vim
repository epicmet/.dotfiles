" --Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'morhetz/gruvbox'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'

Plug 'tpope/vim-commentary'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'vim-airline/vim-airline'
call plug#end()

" --require plugin config
" INFO: I could not work with this LSP SHIT! It just drove me nuts after hours of work ... I would just use COC for now.
" lua require('user')

" --General 
set scrolloff=8
set number
set rnu
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set signcolumn=yes

set termguicolors     " enable true colors support
"set modifiable
colorscheme gruvbox

set updatetime=100
let g:netrw_localrmdir='rm -rf' " Make netrw use 'rm -r' instead of 'rmdir'
let g:netrw_liststyle = 3
let g:netrw_banner = 0

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
augroup END

" --Navigation & Remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
" TODO: Probably do some cool shit with :cdo soon.
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap J :m '>+1 <CR>gv=gv
vnoremap K :m '<-2 <CR>gv=gv
nnoremap <leader>s :Rg<CR>

noremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" --Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
