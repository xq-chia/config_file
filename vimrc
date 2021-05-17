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
Plugin 'SirVer/ultisnips'                   " Load UltiSnips engine that manage code snippet
Plugin 'honza/vim-snippets'                 " Load vim-snippets for snippet engine to use
Plugin 'ervandew/supertab'                  " Load supertab that autocomplete with <Tab> key
Plugin 'Yggdroot/indentLine'                " Load indentLine that visualise indentation with vertical line
Plugin 'skywind3000/vim-preview'            " Load vim-preview that handle preview window
Plugin 'majutsushi/tagbar'                  " Load tagbar that display a code outline viewer
Plugin 'scrooloose/syntastic'               " Load syntastic that check syntax error
Plugin 'easymotion/vim-easymotion'          " Load easymotion that navigate file better
Plugin 'haya14busa/vim-easyoperator-line'   " Load vim-easyoperaotr-line that extend vim-easymotion
Plugin 'haya14busa/vim-easyoperator-phrase' " Load vim-easyoperaotr-line that extend vim-easymotion
Plugin 'wellle/targets.vim'                 " Load targets that extend vim text object
Plugin 'kshenoy/vim-signature'              " Load vim-signature that display mark
Plugin 'simnalamburt/vim-mundo'             " Load vim-mundo that visualise vim undo history
Plugin 'tpope/vim-fugitive'                 " Load vim-fugitive which integrates git
call vundle#end()                           " Terminate initialisation of Vundle
" TODO: coc implementation for completion <04-05-21, yourname> "
" TODO: syntastic replacement <04-05-21, yourname> "
filetype plugin indent on                   " Turn on filetype-specific, plugin-specific indentation rule

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

set number                              " Show the line numbers on the sidebar
set relativenumber                      " Show line number on the current line and relative numbers on all other lines
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

set foldmethod      =syntax             " Automatic fold based on filetype
set foldcolumn      =1                  " Define the number of column to 1 showing a fold

" Open all the fold by default
autocmd BufWinEnter * normal zR 

set listchars       =trail:~,space:·    " Display trailing space as '~' and space as '·'

set noequalalways                       " Splitting window and closing window won't alter the window size

" =============
" Miscellaneous
" =============
set encoding    =utf8                           " Encode file using utf-8 format
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

" =========
" Key remap
" =========
" Yank behave consistent with (c)hange and (d)elete
nnoremap Y y$
nnoremap yy Y

" Open newline without entering insert mode
nnoremap <Leader><CR> o<ESC>

" Format the indentation after put for c file
autocmd FileType c map p p'[=']
autocmd FileType c map P P'[=']

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

" Show man page for C built-in function
inoremap <F1> <C-O>K
nnoremap <F1> K
set keywordprg+=\ 3                     " Allow <S-K> under normal mode to show C function man page

" Include-search
inoremap <M-i> <C-O>:exe "ilist /" . expand("<cword>") . " (/" <Bar>
            \call g:PreviewIncludedFunc()<CR>
nnoremap <M-i> :exe "ilist /" . expand("<cword>") . " (/" <Bar>
            \call g:PreviewIncludedFunc()<CR>

function g:PreviewIncludedFunc()
    let ans=input("Peek at (<Enter> to return): ")

    if ans !~# '^\s*$'
        execute "psearch " . ans . " /" . expand("<cword>") . " (/"
    endif
endfunction

" Jump to start/end of function with K&R style
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

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
" Remove corrupted undofile
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

inoremap <M-f> <C-O>:Lexplore<CR>
nnoremap <M-f> :Lexplore<CR>

" =======================
" Termdebug Configuration
" =======================
packadd termdebug           " Load termdebug default plugin 
let g:termdebug_wide    =1  " Execute gdb program on vsplit

" =====================
" Matchit Configuration
" =====================
packadd matchit         " Load matchit default plugin

" =========================
" Vim-preview Configuration
" =========================
" Display function signature at the command line
nnoremap <NUL> :PreviewSignature!<CR>
inoremap <NUL> <C-O>:PreviewSignature!<CR>
" Display tag file for the word under cursor at the preview window 
nnoremap <NUL><NUL> :PreviewTag<CR>
inoremap <NUL><NUL> <C-O>:PreviewTag<CR>
" Scrolling preview window without switching window focus
nnoremap <M-u> :PreviewScroll -1<CR>
inoremap <M-u> <C-O>:PreviewScroll -1<CR>
nnoremap <M-d> :PreviewScroll +1<CR>
inoremap <M-d> <C-O>:PreviewScroll +1<CR>
" Close preview window
nnoremap <M-x> :pclose<CR>
inoremap <M-x> <C-O>:pclose<CR>
" Preview file
nnoremap <M-l> :let file=input("Peak at: ", "", "file") <Bar>
            \:exe "PreviewFile " . file<CR>
inoremap <M-l> <C-O>:let file=input("Peak at: ", "", "file") <Bar>
            \:exe "PreviewFile " . file<CR>

let g:preview#preview_position  ='top'  " Preview window is opened on top
let g:preview#preview_size      =5      " Preview window has a height of 5 lines

" set tags+=                            " Define tags file for vim to look at

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

set completeopt     =menuone,longest,preview    " Show popup menu even there's only one suggestion, suggest the closest match, show a preview window for additional info

" ==========================
" Vim-closetag Configuration
" ==========================
let g:closetag_emptyTags_caseSensitive  =1              " Enable case sensitive for non-closing tag
let g:closetag_close_shortcut           ='<leader>>'    " Add > at current position without closing the current tag

" ======================
" Air-line Configuration
" ======================
let g:airline#extensions#tabline#enabled            =1                          " Enable 'smarter tab line' extension
let g:airline_powerline_fonts                       =1                          " Integrate airline with powerline font
let g:airline_theme                                 ='base16'
let airline#extensions#syntastic#error_symbol       ='Err:'
let airline#extensions#syntastic#stl_format_err     ='%E{[%fe(#%e)]}'
let airline#extensions#syntastic#warning_symbol     ='W:'
let airline#extensions#syntastic#stl_format_warn    ='%W{[%fw(#%w)]}'

" ======================
" SuperTab Configuration
" ======================
let g:SuperTabDefaultCompletionType     ="context"  " Enable completion based on context
let g:SuperTabLongestHighlight          =1          " Completion suggestion in the completion pop up menu is pre-selected
let g:SuperTabClosePreviewOnPopupClose  =1          " Preview window is closed automatically upon completion done

" ========================
" Auto-pairs Configuration
" ========================
" Tweaks for filetype-specific pairs
autocmd filetype php    let b:AutoPairs=AutoPairsDefine({'<?':'?>'})
autocmd filetype html   let b:AutoPairs=AutoPairsDefine({'<!--':'-->', '<?':'?>'})
autocmd filetype c      let b:AutoPairs=AutoPairsDefine({'/*':'*/'})

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

inoremap <M-o> <C-O>:Tagbar<CR>
nnoremap <M-o> :Tagbar<CR>

" ========================
" EasyMotion Configuration
" ========================
let g:EasyMotion_do_mapping=0

map <Leader> <Plug>(easymotion-prefix)
map <Plug>(easymotion-prefix)f <Plug>(easymotion-f)
map <Plug>(easymotion-prefix)t <Plug>(easymotion-t)
map <Plug>(easymotion-prefix)w <Plug>(easymotion-w)
map <Plug>(easymotion-prefix)e <Plug>(easymotion-e)
map <Plug>(easymotion-prefix)b <Plug>(easymotion-b)
map <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
map <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
map <Plug>(easymotion-prefix)/ <Plug>(easymotion-sn)

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
nnoremap <M-r> <C-O>:MundoToggle<CR>

let g:mundo_width               =winwidth(0) / 5    " Mundo undo window occupy 20% of the screen
let g:mundo_preview_height      =10                 " Mundo diff window occupy 10 lines
let g:mundo_preview_bottom      =1                  " Display Mundo diff window at bottom
let g:mundo_tree_statusline     ="Mundo UndoTree"   " Define name of Mundo undo window
let g:mundo_preview_statusline  ="Mundo Diff"       " Define name of Mundo diff window
let g:mundo_auto_preview_delay  =0                  " Define timeout for Mundo preview

" =======================
" UltiSnips Configuration
" =======================
let g:UltiSnipsEnableSnipMate   =0 " Disable the use of snipmate snippet

" ==========================
" Vim-fugitive Configuration
" ==========================
" Use changes on the left
nnoremap <Leader>f :diffget <Bar> normal ]c<CR>
" Use changes on the right
nnoremap <Leader>j :diffget <Bar> normal ]c<CR>
