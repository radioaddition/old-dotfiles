lua require('init')
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'Mofiqul/adwaita.nvim'
Plug 'junegunn/seoul256.vim'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'nsf/gocode'
Plug 'tpope/vim-fireplace'
Plug 'preservim/nerdtree'
Plug 'sQVe/sort.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
Plug 'MunifTanjim/nui.nvim'

call plug#end()

let g:adwaita_darker = v:true " darker version
let g:adwaita_transparent = v:true " makes the background transparent
colorscheme adwaita
set number
set relativenumber
set cul
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
set lbr
set scrolloff=5
nnoremap <CR> <cmd>FineCmdline<CR>
