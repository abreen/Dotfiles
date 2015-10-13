au BufRead,BufNewFile *.scala set filetype=scala

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype scala setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set magic
set smartindent
set so=3

set fdm=manual

set noshowmode
set noruler
set noesckeys

colorscheme base16-eighties
set background=dark

set hlsearch
set noerrorbells
set novisualbell

syntax on

set ruler
set showcmd

set listchars=tab:▸\ ,trail:·
set list
