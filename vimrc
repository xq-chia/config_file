" ============================
" Plugin manager configuration
" ============================
set nocompatible " Use Vi Improved
filetype off     " Turn off filetype-specific indentation rule, required for Vundle to run properly
set rtp+=~/.vim/bundle/Vundle.vim   " Append the runtime path to include Vundle

call vundle#begin('~/.vim/bundle/')         " Initialise Vundle
Plugin 'VundleVim/Vundle.vim'               " Load vundle plugin
Plugin 'morhetz/gruvbox'                    " Load gruvbox colorscheme
Plugin 'vim-airline/vim-airline'            " Load vim-airline plugin that handle vim status line
Plugin 'vim-airline/vim-airline-themes'     " Load gruvbox theme for vim-airline
Plugin 'mhinz/vim-startify'                 " Load vim-startify that handle vim splash screen
Plugin 'jiangmiao/auto-pairs'               " Load auto-pairs that handle bracket and quote autocompletion
Plugin 'tpope/vim-surround'                 " Load vim-surround that handle surrounding bracket, quote, and tag
Plugin 'tpope/vim-commentary'               " Load vim-commentary that handle code commentary
Plugin 'alvan/vim-closetag'                 " Load vim-closetag that handle html tag autocompletion
Plugin 'Yggdroot/indentLine'                " Load indentLine that visualise indentation with vertical line
Plugin 'majutsushi/tagbar'                  " Load tagbar that display a code outline viewer
Plugin 'easymotion/vim-easymotion'          " Load easymotion that navigate file better
Plugin 'haya14busa/vim-easyoperator-line'   " Load vim-easyoperaotr-line that extend vim-easymotion
Plugin 'haya14busa/vim-easyoperator-phrase' " Load vim-easyoperaotr-line that extend vim-easymotion
Plugin 'wellle/targets.vim'                 " Load targets that extend vim text object
Plugin 'kshenoy/vim-signature'              " Load vim-signature that display mark
Plugin 'simnalamburt/vim-mundo'             " Load vim-mundo that visualise vim undo history
Plugin 'tpope/vim-fugitive'                 " Load vim-fugitive which integrates git
Plugin 'bkad/CamelCaseMotion'               " Load CamelCaseMotion which move cursor with programming naming convention
Plugin 'junegunn/vim-peekaboo'              " Load vim-peekaboo that extends '"' and '@'
call vundle#end()                           " Terminate initialisation of Vundle
filetype plugin indent on                   " Turn on filetype-specific, plugin-specific indentation rule
" ale linter, fixer:  <30-05-21, yourname> "
" coc lsp:  <31-05-21, yourname> "
" ale extend filetype:  <30-05-21, yourname> "
" coc extend filetype:  <30-05-21, yourname> "
" vim-peekaboo:  <31-05-21, yourname> "

" ==========================
" Text, tab, and indentation
" ==========================
set tabstop         =4      " Define the number of spaces the Tab character will take to 4
set shiftwidth      =4      " Define the number of spaces '>>' will take to 4
set shiftround              " When shifting line, round the indentation to the multiple of 'shiftwidth'
set expandtab               " Use space instead of tab character
set softtabstop     =4      " Combine space and Tab character to fulfil tabstop number
set smarttab                " Tab character is used for indentation, space is used for alignment

set autoindent              " New lines inherit indentation from previous line
set smartindent             " Auto indentation reacting to C-style programming

" ========================
" Graphical User Interface
" ========================
set title                               " Set the window's title
set tabpagemax      =10                 " Define the maximum number of tab pages that can be opened

set completeopt     =menuone,longest,preview    " Show popup menu even there's only one suggestion, suggest the closest match, show a preview window for additional info

set number                              " Show the line numbers on the sidebar
set relativenumber                      " Show line number on the current line and relative numbers on all other lines
set signcolumn  =number                         " Merge signcolumn and numbercolumn
set cursorline                          " Highlight the line currently under cursor
set ruler                               " Always show cursor position at the status bar
set scrolloff       =3                  " Always show last 3 lines when scrolling

set laststatus      =2                  " Always display the status bar
set wildmenu                            " Display command line's tab complete options as menu
set showcmd                             " Display incomplete command
set cmdheight       =1                  " Define the height of command bar
set noshowmode                          " Disable built-in mode indicator

set noerrorbells                        " Disable beep on error
set novisualbell                        " Disable flashing screen

set hlsearch                            " Enable search highlighting
set incsearch                           " Enable incremental search that shows partial match
set ignorecase                          " Perform case-insensitive search
set smartcase                           " Perform case-sensitive search when pattern contains uppercase letter

set mouse           =a                  " Enable mouse for scrolling and resizing
set whichwrap       +=h,l,<,>           " Move cursor to the next line when it reaches end of line
set showmatch                           " Jump to the matching opening bracket when typed a closing bracket
set mat             =2                  " Define the waiting time at the opening bracket

colorscheme         gruvbox             " Use gruvbox colorscheme
set background      =dark               " Use dark theme
syntax on                               " Enable syntax highlighting

set wrap                                " Wrap line to fit the window size
set linebreak                           " Wrap line at word boundary
set colorcolumn     =80,100             " Draw a line at column 80

set listchars       =trail:~,space:·    " Display trailing space as '~' and space as '·'

set noequalalways                       " Splitting window and closing window won't alter the window size

" =============
" Miscellaneous
" =============
set encoding    =utf-8                          " Encode file using utf-8 format
set backspace   =indent,eol,start               " Allow backspacing over indentation, line breaks and insertion start
set backupdir   =~/.vim/temp_dir/backupfile     " Define file location for backup file
set backup                                      " Enable backup
set dir         =~/.vim/temp_dir/swapfile       " Define file location for swap file
set swapfile                                    " Enable swapfile
set confirm                                     " Prompt a confirmation dialog when closing an unsaved file
set history     =100                            " Define the number of undo to remember
set spell                                       " Perform spellchecking
set spelllang   =en_gb                          " Define spellchecking to use UK English"
set nrformats   =alpha,hex,bin                  " Define the standard vim used for increment with Ctrl-a and Ctrl-x
set undodir     =~/.vim/temp_dir/undofile       " Define file location for undo file
set undofile                                    " Allow persistent undo feature
set viminfo     +=n~/.vim/viminfo               " Locate viminfor inside .vim directory
let mapleader   ="\<Space>"                     " Define the leader key to <Space>

" ============================
" OmniCompletion Configuration
" ============================
" Enable language-specific autocompletion
autocmd filetype css        set         omnifunc=csscomplete#CompleteCSS
autocmd filetype html       set         omnifunc=htmlcomplete#CompleteTags
autocmd filetype javascript set         omnifunc=javascriptcomplete#CompleteJS
autocmd filetype php        set         omnifunc=phpcomplete#CompletePHP
autocmd filetype c          setlocal    omnifunc=ccomplete#Complete
autocmd filetype cpp        setlocal    omnifunc=cppcomplete#Complete
autocmd filetype python     setlocal    omnifunc=python3complete#Complete
autocmd filetype java       setlocal    omnifunc=javacomplete#Complete

" =========
" Key remap
" =========
" Yank behave consistent with (c)hange and (d)elete
nnoremap Y y$
nnoremap yy Y

" Format the indentation after put for c file
autocmd FileType c map p p'[=']
autocmd FileType c map P P'[=']

" ===========================
" Cursor Movement Keybinding 
" ===========================
" Implement CamelCaseMotion as default motion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" Implement CamelCaseMotion as default in operator-pending mode
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
sunmap w
sunmap b
sunmap e

"  _____       _ _                                                                                             _
" |_   _|     | (_)                                                                                           | |
"   | |  _ __ | |_ _ __   ___    ___ _   _ _ __ ___  ___  _ __   _ __ ___   _____   _____ _ __ ___   ___ _ __ | |_
"   | | | '_ \| | | '_ \ / _ \  / __| | | | '__/ __|/ _ \| '__| | '_ ` _ \ / _ \ \ / / _ \ '_ ` _ \ / _ \ '_ \| __|
"  _| |_| | | | | | | | |  __/ | (__| |_| | |  \__ \ (_) | |    | | | | | | (_) \ V /  __/ | | | | |  __/ | | | |_
" |_____|_| |_|_|_|_| |_|\___|  \___|\__,_|_|  |___/\___/|_|    |_| |_| |_|\___/ \_/ \___|_| |_| |_|\___|_| |_|\__|
nnoremap j gj
nnoremap k gk

" Go to the beginning of the line
" Go to the end of the line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Jump to start/end of function with K&R style
nnoremap [[ ?{<CR>w99[{
nnoremap ][ /}<CR>b99]}
nnoremap ]] j0[[%/{<CR>
nnoremap [] k$][%?}<CR>

" EasyMotion cursor movement
map <Leader> <Plug>(easymotion-prefix)
map <Plug>(easymotion-prefix)f <Plug>(easymotion-f)
map <Plug>(easymotion-prefix)t <Plug>(easymotion-t)
map <Plug>(easymotion-prefix)w <Plug>(easymotion-w)
map <Plug>(easymotion-prefix)e <Plug>(easymotion-e)
map <Plug>(easymotion-prefix)b <Plug>(easymotion-b)
map <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
map <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
map <Plug>(easymotion-prefix)/ <Plug>(easymotion-sn)

" ============================
" Window Management Keybinding
" ============================
" Open directory browser
nnoremap <M-f> :Lexplore<CR>
inoremap <M-f> <C-O>:Lexplore<CR>

" Open debugger
nnoremap <M-d> :Termdebug<CR>
inoremap <M-d> <C-O>:Termdebug<CR>

" Open outliner
nnoremap <M-o> :Tagbar<CR>
inoremap <M-o> <C-O>:Tagbar<CR>

" Open version controller
nnoremap <M-u> :MundoToggle<CR>
inoremap <M-u> <C-O>:MundoToggle<CR>

" Close preview window
nnoremap <M-q> :pclose<CR>
inoremap <M-q> <C-O>:pclose<CR>
" Scroll preview window
nnoremap <M-k> :PreviewScroll -1<CR>
inoremap <M-k> <C-O>:PreviewScroll -1<CR>
nnoremap <M-j> :PreviewScroll +1<CR>
inoremap <M-j> <C-O>:PreviewScroll +1<CR>

" =====================
" Leader Key Keybinding
" =====================
" Use changes on the left
nnoremap <Leader>l :diffget <Bar> normal ]c<CR>
" Use changes on the right
nnoremap <Leader>a :diffput <Bar> normal ]c<CR>

" Disable highlight search
nnoremap <leader>hi :nohls<CR>

" Open newline without entering insert mode
nnoremap <Leader>o o<ESC>

" ============
" Abbreviation
" ============
" Fix sticky shift on write/quit
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq

" Show help message on a new tab
cnoreabbrev h tab h

" ====================
" User-defined Command
" ====================
" Open .vimrc file with :Config command
command Config tabnew ~/.vim/vimrc
" Reload .vimrc file with :Reload command
command Reload source ~/.vim/vimrc | echom "Config reloaded..."
" Toggle 'list' command to show whitespace with :Whitespace command
command Whitespace :call Prettier()
function! Prettier()
    if (&list == 'list')
        echom "Whitespace Prettier enabled..."
        set list
    else
        echom "Whitespace Prettier disabled..."
        set nolist
    endif
endfunction
" Create tag file with :MakeTags command
command MakeTags !ctags
" Remove corrupted undofile with :FixUndoDir command
" TODO: runs automatically when detected error
command FixUndoDir !find ~/.vim/temp_dir/undofile -size 0 -print -delete

" =============
" Alt Key Tweak
" =============
" Allow proper use of alt key
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endwhile

set timeout ttimeoutlen     =50

" =====================================
" Netrw Directory Browser Configuration
" =====================================
" Declare an autocommand group named DirectoryBrowser
" Remove all the autocmd
" Execute :Lexplore automatically when Vim opens
" Focus cursor to the file instead of directory browser
augroup DirectoryBrowser
    autocmd!
    autocmd VimEnter * :Lexplore
    autocmd VimEnter * :wincmd p
augroup END

let g:netrw_winsize         =20     " Open netrw to occupy 20% of the window
let g:netrw_browse_split    =3      " Open file in a new tab
let g:netrw_liststyle       =3      " Display directory browser in tree view

" =======================
" Termdebug Configuration
" =======================
packadd termdebug           " Load termdebug default plugin
let g:termdebug_wide    =1  " Execute gdb program on vsplit

" =====================
" Matchit Configuration
" =====================
packadd matchit         " Load matchit default plugin

" ==========================
" Vim-closetag Configuration
" ==========================
let g:closetag_emptyTags_caseSensitive  =1              " Enable case sensitive for non-closing tag
let g:closetag_close_shortcut           ='<leader>>'    " Add > at current position without closing the current tag

" ======================
" Air-line Configuration
" ======================
let g:airline#extensions#tabline#enabled            =1                          " Enable 'smarter tab line' extension
let g:airline#extensions#tagbar#enabled             =1                          " Enable 'tagbar' extension
let g:airline_powerline_fonts                       =1                          " Integrate airline with powerline font
let g:airline_theme                                 ='base16'
let airline#extensions#ale#error_symbol             ='Err:'
let airline#extensions#ale#warning_symbol           ='W:'

" ========================
" Auto-pairs Configuration
" ========================
let g:AutoPairsFlyMode  =1 " Enable Fly Mode

" ====================
" Tagbar Configuration
" ====================
let g:tagbar_ctags_options              =['NONE', split(&rtp, ",")[0].'/ctags.cnf']
let g:tagbar_width                      =winwidth(0) / 4                            " Tagbar window occupy 25% of the window
let g:tagbar_sort                       =0                                          " Tags are shown according to their order in code file
let g:tagbar_show_data_type             =1                                          " Show data type of tag
let g:tagbar_singleclick                =1                                          " Jump to tag on single click
let g:tagbar_wrap                       =1                                          " Enable line wrapping in tagbar window
let g:tagbar_highlight_follow_insert    =1                                          " Highlight of tag in tabar window will follow cursor position
let g:tagbar_zoomwidth                  =0                                          " Maximise width of tagbar window to only show the longest visible tag
let g:no_status_line                    =1                                          " Status line is not updated in tagbar window

highlight default link TagbarSignature Normal


" ========================
" EasyMotion Configuration
" ========================
let g:EasyMotion_do_mapping=0

highlight EasyMotionTarget          cterm=bold ctermbg=NONE ctermfg=Red gui=bold guibg=NONE guifg=Red
highlight EasyMotionTarget2First    cterm=bold ctermbg=NONE ctermfg=Red gui=bold guibg=NONE guifg=Red
highlight EasyMotionTarget2Second   cterm=bold ctermbg=NONE ctermfg=Red gui=bold guibg=NONE guifg=Red

" ===========================
" Vim-signature Configuration
" ===========================
function s:VimSignatureMapper()
    let l:range=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    for i in l:range
        execute "nnoremap [" . i . " :call signature#marker#Goto('prev', " . i . ", v:count)<CR>"
        execute "nnoremap ]" . i . " :call signature#marker#Goto('next', " . i . ", v:count)<CR>"
    endfor
endfunction

" Jump to marker with [i or ]i
call s:VimSignatureMapper()

" =======================
" Vim-mundo Configuration
" =======================
let g:mundo_width               =winwidth(0) / 5    " Mundo undo window occupy 20% of the screen
let g:mundo_preview_height      =10                 " Mundo diff window occupy 10 lines
let g:mundo_preview_bottom      =1                  " Display Mundo diff window at bottom
let g:mundo_tree_statusline     ="Mundo UndoTree"   " Define name of Mundo undo window
let g:mundo_preview_statusline  ="Mundo Diff"       " Define name of Mundo diff window
let g:mundo_auto_preview_delay  =0                  " Define timeout for Mundo preview
