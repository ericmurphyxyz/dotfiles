" remove stupid autocomment
:set formatoptions-=cro
set tabstop=4

" vim plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

" Support 24-bit color
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
	set termguicolors
endif

" Enable colorizer
lua require'colorizer'.setup()

set background=dark
let g:tokyonight_enable_italic = 1
let g:tokyonight_disable_italic_comment = 1
colorscheme tokyonight

" lightline theme
let g:lightline = {'colorscheme' : 'tokyonight'}
set laststatus=2

" line numbers
set relativenumber

hi Normal guibg=NONE ctermbg=NONE

syntax on

" emmet shortcuts
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

 " ------COC SETTINGS------
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
