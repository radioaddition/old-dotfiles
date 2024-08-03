call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fireplace'
Plug 'sQVe/sort.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
Plug 'Mofiqul/adwaita.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()
let g:adwaita_transparent = v:true
silent! colorscheme adwaita
set number
set relativenumber
set cursorline
au InsertEnter * hi CursorLine gui=underline cterm=underline
au InsertLeave * hi CursorLine gui=none cterm=none guibg=Grey20
set linebreak
set scrolloff=5
nnoremap <CR> <cmd>FineCmdline<CR>
lua << EOF
vim.opt.showmode = false
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF