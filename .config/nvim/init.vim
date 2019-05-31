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
    \ 'cpp': ['~/.local/bin/bin/cquery', '--log-file=/tmp/cq.log', '--init={"CacheDirectory":"/tmp/cquery/"}'],
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
let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/ultisnips"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Aliases Map Vimtex commands to shorter ones
cmap vte VimtexErrors
cmap vtc VimtexCompile



