" Tab navigation
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

filetype plugin indent on
syntax enable

" Plugins with vim-plug
call plug#begin("~/.config/nvim/plugs")
    " VimTeX plugin
    Plug 'lervag/vimtex'

    " UtilSnips plugin
    Plug 'sirver/ultisnips'

    " Rust plugin
    Plug 'rust-lang/rust.vim'

    " Deoplete - autocompletion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " Language client for neovim
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
    \ }

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'

    " Tagbar
    Plug 'majutsushi/tagbar'

    " Airline status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Autostart Deoplete
let g:deoplete#enable_at_startup = 1

" Required for operations modifying multiple buffers like rename.
set hidden

" Autostart language servers
let g:LanguageClient_autoStart = 1

" Disable snippet support
let g:LanguageClient_hasSnippetSupport = 0

" Language servers
let g:LanguageClient_serverCommands = {
    \ 'rust': ['env', 'CARGO_TARGET_DIR=/tmp/rls', '~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

" Whether to show diagnostics inline (1) or in status bar (0).
" Default: 1
let g:LanguageClient_useVirtualText = 0

" Do not truncate completion menu width.
autocmd BufReadPost * call deoplete#custom#source('LanguageClient', 'max_menu_width', 0)

" Indentation settings for specific projects
augroup ProjectSetup
au BufRead,BufEnter ~/Desktop/projects/omr/* set autoindent noexpandtab tabstop=4 shiftwidth=4
augroup END

" YCM-like forward and backward scrolling in autocompletion.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
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
"set cursorline

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
let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/ultisnips"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Aliases Map Vimtex commands to shorter ones
cmap vte VimtexErrors
cmap vtc VimtexCompile

" Tagbar with ctags
nmap <F8> :TagbarToggle<CR>

" Tagbar window width.
let g:tagbar_width = 40

" Adjust window width to the longest line.
" let g:tagbar_expand = 1

" Show line numbers:
" 0 - none,
" 1 - absolute,
" 2 - relative.
let g:tagbar_show_linenumbers = 0

" Close tagbar window when jumping to a tag.
let g:tagbar_autoclose = 1

" Do not show 'F1' help message at the top of tagbar window.
" let g:tagbar_compact = 1

" Preview code. BOJESTVENNO!!!
let g:tagbar_autopreview = 1

" Show full tag in status line.
let g:airline#extensions#tagbar#flags = 'f'

let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \ 'n:modules',
        \ 's:structures:1',
        \ 'i:interfaces',
        \ 'c:implementations',
        \ 'f:functions:1',
        \ 'g:enumerations:1',
        \ 't:type aliases:1:0',
        \ 'v:constants:1:0',
        \ 'M:macros:1',
        \ 'm:fields:1:0',
        \ 'e:enum variants:1:0',
        \ 'P:methods:1',
    \ ],
    \ 'sro': '::',
    \ 'kind2scope' : {
        \ 'n': 'module',
        \ 's': 'struct',
        \ 'i': 'trait',
        \ 'c': 'implementation',
        \ 'f': 'function',
        \ 'g': 'enum',
        \ 't': 'type alias',
        \ 'v': 'variable',
        \ 'M': 'macro',
        \ 'm': 'field',
        \ 'e': 'variant',
        \ 'P': 'method',
    \ },
\ }

" Airline theme
let g:airline_theme = 'luna'

:set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
:autocmd OptionSet guicursor noautocmd set guicursor=
