set nocompatible   " must be first line
filetype plugin on
filetype indent on
syntax on
let g:disable_google_optional_settings=1

set rtp+=~/.vim/bundle/vundle/
"set rtp+=/usr/local/go/misc/vim/
call vundle#rc()

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
"set term=builtin_ansi " Fixes navigation with arrow keys in insert mode
Bundle "vundle"

"Bundle "kablamo/vim-git-log"
"Bundle "mhinz/vim-startify"
"Bundle "sudar/vim-arduino-syntax"
"Bundle "amiorin/vim-project"
"Bundle "Lokaltog/vim-powerline"
"Bundle "Rip-Rip/clang_complete"
"Bundle "Shougo/neocomplcache"
"Bundle "Townk/vim-autoclose"
"Bundle "Twinside/vim-haskellConceal"
"Bundle "Yggdroot/indentLine"
"Bundle "a.vim"
"Bundle "chrisbra/NrrwRgn"
"Bundle "chrisbra/changesPlugin"
"Bundle "corntrace/bufexplorer"
"Bundle "csv.vim"
"Bundle "ervandew/supertab"
"Bundle "hsitz/VimOrganizer"
"Bundle "jceb/vim-orgmode"
"Bundle "kien/ctrlp.vim"
"Bundle "mbbill/VimExplorer"
"Bundle "mhinz/vim-signify"
"Bundle "mhinz/vim-tmuxify"
"Bundle "mileszs/ack.vim"
"Bundle "msanders/snipmate.vim"
"Bundle "myusuf3/numbers.vim"
"Bundle "nathanaelkane/vim-indent-guides"
"Bundle "scrooloose/nerdcommenter"
"Bundle "scrooloose/nerdtree"
"Bundle "scrooloose/syntastic"
"Bundle "sjl/gundo.vim"
"Bundle "sjl/splice.vim"
"Bundle "t9md/vim-quickhl"
"Bundle "tsaleh/vim-matchit"
"Bundle "tyok/nerdtree-ack"
"Bundle "vim-scripts/IndentConsistencyCop"
"Bundle "vim-scripts/Mark--Karkat"
"Bundle "vim-scripts/YankRing.vim"
"Bundle "vim-scripts/taglist.vim"
"Bundle "vimoutliner/vimoutliner"
"Bundle "wincent/Command-T"

Bundle "Lokaltog/vim-easymotion"
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimproc.vim"
Bundle "ShowMarks"
Bundle "SirVer/ultisnips"
Bundle "Valloric/YouCompleteMe"
Bundle "airblade/vim-gitgutter"
Bundle "altercation/vim-colors-solarized"
Bundle "bling/vim-airline"
Bundle "gregsexton/gitv"
Bundle "groenewege/vim-less"
"Bundle "jnwhiteh/vim-golang"
Bundle "majutsushi/tagbar"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-vinegar"
Bundle "Blackrush/vim-gocode"

"may be slow
Bundle "tpope/vim-fugitive"

try
  source /usr/share/vim/google/google.vim
  Glug grok
  " source /usr/share/vim/google/runtime/grok.vim
"  source /usr/share/vim/google/gtags.vim
  "source /usr/share/vim/google/runtime/gtimporter.vim
  "source ~/gtimporter.vim
"  source /google/data/ro/projects/vigor/vigor.vim
"  Glug youcompleteme-google
catch
endtry


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn\|\.git5_specs$\|review$\|magicjar',
  \ 'file': '\.class$|\.exe$\|\.so$\|\.dll$',
  \ 'link': 'blaze-bin\|blaze-genfiles\|blaze-google3\|blaze-out\|blaze-testlogs\|READONLY$',
  \ }
" match by filename rather than full path (<c-d> in the prompt)
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 100

" changesPlugin

"let g:changes_autocmd=1
"let g:changes_vcs_check=1
"let g:changes_vcs_system='git'

 " neocomplcache {
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_auto_completion_start_length = 3
    let g:neocomplcache_force_overwrite_completefunc = 1
    "let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate-snippets/snippets'

    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 0

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType go setlocal omnifunc=go#complete#Complete

    autocmd BufWrite *.go :silent Fmt

    autocmd BufNewFile,BufRead *.less setf less

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.java = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.go = '\%(\h\w*\|)\)\.'

    let g:neocomplcache_omni_patterns = {}

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    "inoremap <expr><CR> pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
    "inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

    "inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
    function! s:check_back_space()
      let col = col('.') - 1
      return !col || getline('.')[col - 1] =~ '\s'
    endfunction
 " }

  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#073642 ctermbg=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#073642 ctermbg=0

  autocmd FileType go setl noexpandtab | setl softtabstop=0 | setl shiftwidth=8 | setl tabstop=8
  autocmd FileType html setl expandtab | setl softtabstop=0 | setl shiftwidth=2 | setl tabstop=2
  autocmd FileType xml setl expandtab | setl softtabstop=0 | setl shiftwidth=2
  autocmd FileType arduino setl expandtab | setl softtabstop=0 | setl shiftwidth=2

"  autocmd VimEnter * RainbowParenthesesToggle
"  autocmd Syntax * RainbowParenthesesLoadRound
"  autocmd Syntax * RainbowParenthesesLoadSquare
"  autocmd Syntax * RainbowParenthesesLoadBraces

" org-mode {
  let g:org_todo_keywords = ['TODO', 'STARTED', 'DONE']
  let g:org_todo_keyword_faces = [
        \  ['TODO', 'red', ':background white'],
        \  ['STARTED', 'cyan'],
        \  ['DONE', 'green']
        \]

  let g:org_todo_setup = 'TODO STARTED | DONE'
  hi! DONETODO guifg=green
  hi! NOTDONETODO guifg=red

" Key (re)mappings {
    " Consider Space
    let mapleader = ","

    " <C-h>, <BS>: close popup and delete backword char.
    "inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  neocomplcache#close_popup()

    " Disable Ex mode
    nnoremap Q <nop>
    nnoremap j gj
    nnoremap k gk

    " Clipboard fixes
    vnoremap <leader>y "+y
    vnoremap <leader>Y "+y
    vnoremap <leader>d "+d
    vnoremap <leader>D "+D
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P

    " Explorer
    nnoremap <leader>e :Explore<CR>

    " Arrow keys resize
    noremap <Up> <C-w>-
    noremap <Down> <C-w>+
    noremap <Left> <C-w><
    noremap <Right> <C-w>>

    " folding
    nnoremap <Space> za
    vnoremap <Space> za

    " Clearing highlighted search
    nnoremap <silent> <leader>/ :nohlsearch<CR>

    "jj to normal mode
    inoremap jj <Esc>

    " Use relative numbers when out of insert mode
    " augroup Numbers
    "   autocmd!
    "   autocmd InsertEnter * :set number
    "   autocmd InsertLeave * :set relativenumber
    "   autocmd FocusLost * :set number
    "   autocmd FocusGained * :set relativenumber
    "   autocmd BufNewFile * :set number
    "   autocmd BufReadPost * :set number
    " augroup END
    " If Esc a second time, then use absolute numbers
    " nnoremap <Esc> <Esc>:set number<CR>


    noremap [[ ?{<CR>w99[{
    noremap ][ /}<CR>b99]}
    noremap ]] j0[[%/{<CR>
    noremap [] k$][%?}<CR>

    " For vim-tmuxify
    " vnoremap <CR> "my :TxSend(@m)<CR>


    " Easier moving in tabs and windows
    noremap <C-J> <C-W>j
    noremap <C-K> <C-W>k
    noremap <C-L> <C-W>l
    noremap <C-H> <C-W>h
    noremap <C-K> <C-W>k
    noremap <S-H> gT
    noremap <S-L> gt
"    map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

    " Stupid shift key fixes
    cnoremap W w
    cnoremap WQ wq
    cnoremap wQ wq
    cnoremap Q q
    cnoremap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Reselect visual block after indent.
    nnoremap < <gv
    nnoremap > >gv

    " Shortcuts
    " Change Working Directory to that of the current file
    "cmap cwd lcd %:p:h

    " Force saving files that require root permission
    cnoremap w!! %!sudo tee > /dev/null %

    nnoremap <leader>i :call GtImporter() <CR>
    nnoremap <leader>s :call GtImporter_SortImports() <CR>

    " Eclim settings
    " ,i imports whatever is needed for current line
    nnoremap <silent> <LocalLeader>ji :JavaImport<cr>
    " ,d opens javadoc for statement in browser
    nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
    " ,<enter> searches context for statement
"    nnoremap <silent> <cr> :JavaSearchContext<cr>
    " ,jv validates current java file
    nnoremap <silent> <LocalLeader>jv :Validate<cr>
    " ,jc shows corrections for the current line of java
    nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
    " 'open' on OSX will open the url in the default browser without issue

    "  Save the current file, run buildifier to fix formatting, and reload it
    command! Buildify :w | execute "!/google/data/ro/projects/devtools/buildifier/buildifier --mode=fix %" | edit
    command! Gofmt :w | execute "!go fmt %"

"    nmap <C-]> :exe 'let searchtag= "' . expand('<cword>') . '"' \| :exe 'let @/= "' . searchtag . '"'<CR> \| :exe 'Gtlist ' . searchtag <CR>
" }

set wildignore+=*/READONLY/*,*/blaze-*,*/magicjar/*

let g:unite_source_rec_min_cache_files=0
let g:unite_source_rec_max_cache_files=0
let g:unite_source_history_yank_enable = 1
nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async<CR>
nnoremap <leader>/ :<C-u>Unite grep:.<CR>
nnoremap <leader>* :<C-u>Unite grep:.<CR><C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>y :<C-u>Unite history/yank<cr>
nnoremap <leader>b :<C-u>Unite -quick-match buffer<cr>
nnoremap <leader>g :<C-u>Unite grep:.<CR>
"nnoremap <C-r> <plug>(unite_redraw)

" taglist
let Tlist_Display_Prototype = 1

" powerline
let g:Powerline_symbols = 'compatible'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_right_sep = '«'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'

  " Too noisy for google3
  let g:airline#extensions#whitespace#enabled = 0

  let g:airline#extensions#default#layout = [
        \ [ 'a', 'b', 'c' ],
        \ [ 'x', 'z', 'warning' ]
        \ ]

" Tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"set omnifunc="<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&completefunc:<c-x><c-u>","&omnifunc:<c-x><c-u>"]
let g:SuperTabLongestHighlight = 1

"source /google/src/head/depot/eng/vim/runtime/outline_window.vim
"nnoremap ,g :call OutlineWindow()<CR>

"source /google/src/head/depot/eng/vim/runtime/util/piper_tools.vim
nnoremap ;j :call PT_SelectActiveFiles()<CR>
nnoremap ;e :call PT_LoadActiveAsBuffers()<CR>

" General
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org set filetype=org
au! BufRead,BufWrite,BufWritePost,BufNewFile *.borg set colorcolumn=80
au! BufRead,BufWrite,BufWritePost,BufNewFile *.proto set colorcolumn=80
au! BufRead,BufWrite,BufWritePost,BufNewFile *.xml set colorcolumn=80
"au BufEnter *.org set filetype=org


" Open NERDTree if no files were specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left is NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Let Vim follow NERDTree root as current dir
let g:NERDTreeChDirMode=2
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=60
let g:NERDTreeCasadeOpenSingleChildDir=1
" Locate current file in NERDTree
"nmap ,n :NERDTreeFind<CR>
" Toggle NERDTree visibility
let NERDTreeShowBookmarks = 1

nmap ,n :Explore!<CR>
nmap ,m :Explore! .<CR>
"let g:netrw_altv=1
" What's wrong here?
let g:netrw_liststyle=1
"let g:netrw_preview=1
"let g:netrw_browse_split=4
let g:netrw_winsize=30
let g:netrw_special_syntax=1
let g:netrw_maxfilenamelen=40

augroup netrw
  autocmd!
"  autocmd filetype netrw call Netrw()
augroup END
function! Netrw()
"  nmap <buffer> o <CR>
"  nmap <buffer> u -
endfunction

" not every vim is compiled with this, use the following line instead
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
scriptencoding utf-8

"if has('win32') || has('win64')
"  set guifont=Terminus:h12
"else
"  set guifont=Terminus\ Medium\ 9
"endif
set guifont=Terminus\ 9

"set autowrite
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
"set spell           " spell checking on

function! EnsureDir(dir)
  if isdirectory(a:dir) == 0
    execute "silent !mkdir -p " . a:dir
  endif
endfunction

" Setting up the directories
set backup       " backups are nice ...
:call EnsureDir("~/.vim/backup")
:call EnsureDir("~/.vim/swap")
:call EnsureDir("~/.vim/views")
:call EnsureDir("~/.vim/undo")
set backupdir=~/.vim/backup " but not when they clog .
" For crontab -e editing
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/swap  " Same for swap files
set viewdir=~/.vim/views  " same but for view files
set undodir=~/.vim/undo
set noautochdir

let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mysnippets"]

set expandtab
set textwidth=100 "0
set history=1000
set undofile
set undolevels=1000
set undoreload=10000

set mouse=a     " automatically enable mouse usage

set foldenable
set foldmethod=syntax
set foldlevel=9999
set foldlevelstart=9999
set foldcolumn=4

set updatetime=1000

set viewoptions=cursor,folds
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

" Creating directories if they don't exist
"silent execute '!mkdir -p $HOME/.vimbackup'
"silent execute '!mkdir -p $HOME/.vimswap'
"silent execute '!mkdir -p $HOME/.vimviews'
"au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
"au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
set t_Co=16
"color ir_black               " load a colorscheme
set background=dark     " Assume a dark background
"    let g:solarized_termtrans=1
let g:solarized_termcolors=16
"    let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_diffmode="high"    "default value is normal
"    let g:solarized_visibility="high"
colorscheme solarized

func! DiffSetup()
  " Do not hide any of the unchanged lines.
  set diffopt=filler,context:1000000000
  " Make sure split is even.
  wincmd =
  " tkdiff style keys.
  map n ]c
  map N [c
  map <C-N> :qa<CR>
  " Move to bottom-right split (containing the most recent file).
  wincmd j
  wincmd l
  " Move the cursor to the beginning of the file.
  call setpos('.', [0, 0, 0, 0])
  " Update diff at every edit.
  autocmd BufWritePost * diffupdate
endfun

func! MultiDiffSetup()
  " multi diff setup:
  set lazyredraw
  set splitright  " put new version right of the old version

  " $P4DIFF is called with ': $OLD1 $NEW1 : $OLD2 $NEW2 ...' as args
  " First we strip out all the : arguments
  argdelete *:

  " Then we pair up everything else in tabs with vertical diff splits
  exe "silent edit " . fnameescape(argv(0))
  exe "silent vertical diffsplit " . fnameescape(argv(1))
  wincmd =

  let s:idx = 2
  while s:idx < argc()
    tabnew
    exe "silent edit " . fnameescape(argv(s:idx))
    exe "silent vertical diffsplit " . fnameescape(argv(s:idx + 1))
    wincmd =
    let s:idx += 2
  endwhile

  " Go to first tab page
  tabrewind

  " redraw now
  set nolazyredraw
  redraw
endfun


if &diff
  autocmd VimEnter * call DiffSetup()
endif

augroup g4file
  " Do filetypedetect for files ending in version markers as if they didn't
  au!
  au BufRead ?\+#[0-9]\+  exe "doau filetypedetect BufRead " . fnameescape(substitute(expand("<afile>"), '#[0-9]\+$', '', ''))
augroup END

set tabpagemax=15     " only show 15 tabs
set showmode                    " display the current mode
set splitright
set splitbelow

"set fdm=syntax
"set fdc=5
highlight Folded guibg=blue guifg=white
highlight FoldColumn guibg=blue guifg=white

if exists('+colorcolumn')
  set colorcolumn=100
else
  highlight OverLength ctermbg=red ctermfg=white guibg=red
  match OverLength /\%101v.\+/
endif

"set listchars=eol:?,trail:?
set listchars=tab:»\ ,trail:·
"set listchars=
set list

set cursorline      " highlight current line

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

if has('cmdline_info')
  set noruler                   " show the ruler
  "  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set rulerformat=%50(%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P\ %)" a statusline, also on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

set laststatus=2            " Always show statusline
"if has('statusline')
  " Use the commented line if fugitive isn't installed
  "set statusline=%f%m%r%h%w\ %y\ [ASCII=\%03.3b=0x\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
  "set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
  " set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
  "set statusline=%<%f\ %h%m%r%fugitive#statusline()%=%-14.(%l,%c%V%)\ %P
"endif

set backspace=indent,eol,start  " backspace for dummys
set cino-=(0 "do not align to open parenthesis
set linespace=0     " No extra spaces between rows
set number        " Line numbers on
set winminheight=0     " windows can be 0 line high

"nnoremap / /\v
"vnoremap / /\v
set ignorecase      " case insensitive search
set smartcase      " case sensitive when uc present
set gdefault     " the /g flag on :s substitutions by default
set showmatch                   " show matching brackets/parenthesis
set incsearch      " find as you type search
set hlsearch      " highlight search terms

set wildmenu      " show list instead of just completing
set wildmode=list:longest,full  " comand <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
"set scrolljump=5     " lines to scroll when cursor leaves screen
set scrolloff=5     " minimum lines to keep above and below cursor

" Formatting
set wrap                      " wrap long lines
set linebreak     " wrap without breaking words
set smartindent
set autoindent                  " indent at the same level of the previous line
set shiftwidth=2                " use indents of 4 spaces
set tabstop=4      " an indentation every four columns
set softtabstop=2
set expandtab
"set matchpairs+=<:>             " match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set formatoptions+=l " don't break long lines in insert mode
set formatoptions+=c " wrap comments
set formatoptions+=r " insert comment leader after <enter>
set formatoptions-=o " do not insert comment leader after o or O
set formatoptions+=j " remove comment leader when joining lines

func! MailSetup()
  setlocal formatoptions=aw
  setlocal colorcolumn=72
  setlocal textwidth=72
  setlocal spell
"  setlocal completeopt=
"  setlocal completefunc=
endfun

autocmd FileType mail call MailSetup()
autocmd FileType gitcommit call MailSetup()

autocmd FileType help setlocal colorcolumn=80

autocmd FileType git5message setlocal colorcolumn=0
autocmd FileType git5message setlocal textwidth=0

let g:ycm_filetype_blacklist = {
      \ 'git5message' : 1,
      \ 'mail' : 1,
      \ 'markdown' : 1,
      \ 'notes' : 1,
      \ 'qf' : 1,
      \ 'tagbar' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'vimwiki' : 1,
      \}

"autocmd FileType html set formatoptions+=a
"autocmd FileType html set textwidth=80
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
"set lcs=tab:??,trail:?,extends:>,precedes:<,nbsp:&

" Complete only the current buffer and includes
set complete=.,i

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Plugins

" VCSCommand
let b:VCSCommandMapPrefix=',v'
let b:VCSCommandVCSType='git'

let g:checksyntax_auto = 0

"comment out line(s) in visual mode
"vmap  o  :call NERDComment(1, 'toggle')<CR>
"let g:NERDShutUp=1

let b:match_ignorecase = 1

" ShowMarks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'"
" For marks a-z
highlight ShowMarksHLl ctermbg=black ctermfg=red
" For marks A-Z
highlight ShowMarksHLu ctermbg=black ctermfg=darkred
" For all other marks
highlight ShowMarksHLo ctermbg=black ctermfg=cyan
" For multiple marks on the same line.
highlight ShowMarksHLm ctermbg=black ctermfg=white

augroup Marks
  autocmd!
  "autocmd CursorHold * :ShowMarksOn
  "autocmd CursorHoldI * :ShowMarksOn
  "autocmd CursorMoved * :ShowMarksOn
  "autocmd CursorMovedI * :ShowMarksOn
augroup END

" Popup menu hightLight Group
"highlight Pmenu  ctermbg=13  guibg=DarkBlue
highlight PmenuSel  ctermbg=7  guibg=DarkBlue   guifg=LightBlue
"highlight PmenuSbar ctermbg=7  guibg=DarkGray
"highlight PmenuThumb    guibg=Black

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

set tags=./tags;/,tags,~/.vimtags,c:/cpp,~/.vim/tags/cpp
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" EasyTags
"let g:easytags_cmd = '/usr/local/bin/ctags'

" Delimitmate
"au FileType * let b:delimitMate_autoclose = 1

" If using html auto complete (complete closing tag)
"au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],:"

" AutoCloseTag
" Make it so AutoCloseTag works for xml and xhtml files as well
"au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim

" AutoClose
let g:AutoClosePairs_del = "{}"

" GUI Settings
" GVIM- (here instead of .gvimrc)
if has('gui_running')
  "set guioptions-=T           " remove the toolbar
  set guioptions+=b  "horizontal scrollbar
  set lines=80                " 40 lines of text instead of 24,
  set columns=250
endif

" Windows Compatible
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"au BufNewFile,BufRead *.cl set filetype=cpp

set sessionoptions-=options "do not store variables in session file
set sessionoptions-=curdir "do not store current dir in session file
set viewoptions-=folds

set viminfo='1000,f1

"    set diffopt+=iwhite "ignore whitespaces in vimdiff
set diffopt+=vertical

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" perforce commands
command! -nargs=* -complete=file PEdit :!g4 edit %
command! -nargs=* -complete=file PRevert :!g4 revert %
command! -nargs=* -complete=file PDiff :!g4 diff %

function! s:CheckOutFile()
  if filereadable(expand("%")) && ! filewritable(expand("%"))
    let s:pos = getpos('.')
    let option = confirm("Readonly file, do you want to checkout from p4?"
          \, "&Yes\n&No", 1, "Question")
    if option == 1
      PEdit
    endif
    edit!
    call cursor(s:pos[1:3])
  endif
endfunction
au FileChangedRO * nested :call <SID>CheckOutFile()

function! G4Blame(on_file)
  " Grab the filename from the argument, use expand() to expand '%'.
  let file = expand(a:on_file)
  " Lock scrolling in right pane
  setl scb
  " Create left pane
  vnew
  " It's 37 columns wide
  vert res 37
  " Get the output, split it on newline and keep empty lines, skip the first 5
  " lines because they're headers we don't need, and put it in starting on line
  " 1 of the left pane
  call setline(1, split(system('g4 blame ' . file), '\n', 1)[5:])
  " Lock scrolling in left pane, turn off word wrap, set the buffer as
  " not-modified, remove any listchars highlighting (common in google code), set
  " it readonly (to make modifications slightly more annoying.
  setl scb nowrap nomod nolist ro
  " Move back to the right pane (not sure if there's a better way to do this?)
  exe "normal \<c-w>\<right>"
  " Get the non-active pane scrolled to the same relative offset.
  syncbind
endfunction

com! -nargs=1 Blame :call G4Blame(<args>)

set noesckeys    " disable keys sending escape sequences in insert mode (fixes delay after pressing ESC in terminal)

" Eclim settings
let g:EclimJavaImportPackageSeparationLevel = 1
let g:EclimJavaCompleteCaseSensitive = 1
let g:EclimBrowser='open'
let g:EclimCompletionMethod='omnifunc'
"noremap <C-]> :JavaSearch<CR>

" Offer to reload the file if it changed.
:au BufEnter * checktime
set autoread " should do it without prompting

function! DoGit5Diff()
  let s:revision = system('git5 status --base')
  exe "Gdiff " . s:revision
endfunction
command! G5diff call DoGit5Diff()

function! G3RelPath()
  let path = expand('%:.:h')
  let rule = path . ":all"
  execute ':!blaze build '.rule
  echo rule
endfunction

command! BB :call G3RelPath()

" Relative numbers
" set rnu
" au BufEnter * :set rnu
" au BufLeave * :set nu
" au WinEnter * :set rnu
" au WinLeave * :set nu
" au InsertEnter * :set nu
" au InsertLeave * :set rnu
" au FocusLost * :set nu
" au FocusGained * :set rnu

"autocmd ColorScheme * 
highlight def MarkWord ctermbg=Magenta ctermfg=White guibg=Grey

function! MarkWord()
    let l:cword = expand('<cword>')
    call clearmatches()
    call matchadd('MarkWord', l:cword)
endfunction
"autocmd CursorMoved * :call MarkWord()

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
augroup END

" Color test: Save this file, then enter ':so %'
" Then enter one of following commands:
"   :VimColorTest    "(for console/terminal Vim)
"   :GvimColorTest   "(for GUI gvim)
function! VimColorTest(outfile, fgend, bgend)
  let result = []
  for fg in range(a:fgend)
    for bg in range(a:bgend)
      let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
      let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
      let s = printf('syn keyword %s %s', kw, kw)
      call add(result, printf('%-32s | %s', h, s))
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
" Increase numbers in next line to see more colors.
command! VimColorTest call VimColorTest('vim-color-test.tmp', 12, 16)

function! GvimColorTest(outfile)
  let result = []
  for red in range(0, 255, 16)
    for green in range(0, 255, 16)
      for blue in range(0, 255, 16)
        let kw = printf('%-13s', printf('c_%d_%d_%d', red, green, blue))
        let fg = printf('#%02x%02x%02x', red, green, blue)
        let bg = '#fafafa'
        let h = printf('hi %s guifg=%s guibg=%s', kw, fg, bg)
        let s = printf('syn keyword %s %s', kw, kw)
        call add(result, printf('%s | %s', h, s))
      endfor
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
command! GvimColorTest call GvimColorTest('gvim-color-test.tmp')

map gf :call DoGf()<ENTER>

function! DoGf()
  let file = expand("<cfile>")
  if match(file, "^//production") == 0
    let google3 = substitute(expand("%:p"), "/google3/.*", "/google3/", "")
  else
    let google3 = ""
  endif
  exe "edit " . google3 . file
endfun