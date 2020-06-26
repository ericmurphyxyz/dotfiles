" remove stupid autocomment
:set formatoptions-=cro

" vim plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Support 24-bit color
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
	set termguicolors
endif

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

 " ------COC SETTINGS------
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
