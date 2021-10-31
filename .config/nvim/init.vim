let g:deoplete#enable_at_startup = 1

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
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " Language client for neovim
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
    \ }

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'

    " Tagbar
    Plug 'majutsushi/tagbar'

    " gutentags for tag file generation
    "Plug 'ludovicchabant/vim-gutentags'

    " Airline status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Nerd tree
    Plug 'scrooloose/nerdtree'

    " English grammar checker
    Plug 'rhysd/vim-grammarous'

    " Surroundings
    Plug 'tpope/vim-surround'

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
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'cpp': ['~/Desktop/ccls/Release/ccls'],
    \ }

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
"let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/ultisnips"
"let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips']
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


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

" Automatically start NERDTree when vim is started
"autocmd vimenter * NERDTree

" Shortcut to open Nerdtree
nmap <F6> :NERDTreeToggle<CR>

" Gutentag is annoying when wq-ing vim.
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

" Add autogroup for tag generation
augroup tagAug
  autocmd!
  " If we're working in a git commit (or similar), disable tag file generation
  autocmd FileType git,gitcommit,gitrebase,gitsendemail :let g:gutentags_enabled=0
augroup end
