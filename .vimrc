" Tab navigation
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Plugins with vim-plug
call plug#begin("~/.vim/plugs")

    " VimTeX plugin
    Plug 'lervag/vimtex'

    " UtilSnips plugin
    Plug 'sirver/ultisnips'

call plug#end()

" Turn off absolution and turn on positive, numbering
"set nonu
set number
set relativenumber

" Set background to dark
set background=dark

" Changing background color of line numbers
highlight LineNr ctermfg=lightgrey ctermbg=NONE

" Highlight current line number
highlight CursorLineNR cterm=NONE ctermbg=darkgreen ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Remove delay
set timeoutlen=1000 ttimeoutlen=0

" For VimTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips configs
"inoremap <tab> <Nop>
"inoremap <s-tab> <Nop>
let g:UltiSnipsSnippetsDir = $HOME."/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Aliases Map Vimtex commands to shorter ones
cmap vte VimtexErrors
cmap vtc VimtexCompile
