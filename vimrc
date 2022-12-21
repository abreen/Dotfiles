map! ^[OA ^[ka
map! ^[OB ^[ja
map! ^[OC ^[la
map! ^[OD ^[ha

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype sh setlocal expandtab
autocmd Filetype python setlocal expandtab
autocmd Filetype java setlocal expandtab
autocmd Filetype php setlocal expandtab
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown setlocal expandtab

set magic
set smartindent
set so=3

"set foldmethod=syntax
set foldmethod=indent foldlevelstart=2 foldnestmax=2

set ruler
set showcmd
set nonumber
set noshowmode

set hlsearch
set noerrorbells
set novisualbell

colorscheme dim
syntax on

highlight VisualNOS term=none
highlight TabLine term=none
highlight PreProc term=none
highlight Type term=bold
highlight Identifier term=none
highlight Constant term=none
"highlight Underlined term=none
highlight Comment term=none
highlight Search term=underline
highlight LineNr term=none
highlight EndOfBuffer term=none
