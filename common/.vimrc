set nocompatible   " must be first line
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'ConradIrwin/vim-bracketed-paste'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'Shougo/neocomplcache'
"Plugin 'Shougo/unite.vim'
"Plugin 'ShowMarks'
"Plugin 'Twinside/vim-haskellConceal'
"Plugin 'Yggdroot/indentLine'
"Plugin 'a.vim'
"Plugin 'airblade/vim-rooter'
"Plugin 'akesling/ondemandhighlight'
"Plugin 'amiorin/vim-project'
"Plugin 'chrisbra/NrrwRgn'
"Plugin 'chrisbra/changesPlugin'
"Plugin 'corntrace/bufexplorer'
"Plugin 'csv.vim'
"Plugin 'ervandew/supertab'
"Plugin 'honza/vim-snippets'
"Plugin 'hsitz/VimOrganizer'
"Plugin 'jceb/vim-orgmode'
"Plugin 'jnwhiteh/vim-golang'
"Plugin 'kablamo/vim-git-log'
"Plugin 'kien/ctrlp.vim'
"Plugin 'mbbill/VimExplorer'
"Plugin 'mhinz/vim-startify'
"Plugin 'mhinz/vim-tmuxify'
"Plugin 'mileszs/ack.vim'
"Plugin 'msanders/snipmate.vim'
"Plugin 'myusuf3/numbers.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'nsf/gocode', {'rtp': 'vim/'}
"Plugin 'scrooloose/nerdtree'
"Plugin 'sjl/gundo.vim'
"Plugin 'sjl/splice.vim'
"Plugin 'sudar/vim-arduino-syntax'
"Plugin 't9md/vim-quickhl'
"Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-speeddating'
"Plugin 'tpope/vim-surround'
"Plugin 'tsaleh/vim-matchit'
"Plugin 'tyok/nerdtree-ack'
"Plugin 'vim-scripts/IndentConsistencyCop'
"Plugin 'vim-scripts/Mark--Karkat'
"Plugin 'vim-scripts/YankRing.vim'
"Plugin 'vim-scripts/dbext.vim'
"Plugin 'vim-scripts/taglist.vim'
"Plugin 'vimoutliner/vimoutliner'
"Plugin 'wincent/Command-T'
"Plugin 'krisajenkins/vim-pipe'

"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'SirVer/ultisnips'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'majutsushi/tagbar'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'groenewege/vim-less'

"Plugin 'terryma/vim-expand-region'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Townk/vim-autoclose'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'cespare/vim-toml'
Plugin 'chrisdone/hindent', {'rtp': 'vim'}
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'fatih/vim-go'
Plugin 'gregsexton/gitv'
Plugin 'jceb/vim-orgmode'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'

Plugin 'oblitum/rainbow'
Plugin 'othree/html5.vim'
Plugin 'phildawes/racer'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'unblevable/quick-scope'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-scripts/argtextobj.vim'

" Must be in this order.
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

call vundle#end()

syntax on
filetype plugin indent on

let mapleader=','
let maplocalleader='#'

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"set term=builtin_ansi " Fixes navigation with arrow keys in insert mode

if filereadable(expand('~/.at_google'))
  let g:disable_google_optional_settings=1

  source /usr/share/vim/google/glug/bootstrap.vim
  source /usr/share/vim/google/google.vim

  autocmd FileType bzl,blazebuild AutoFormatBuffer buildifier
  "autocmd FileType c,cpp,javascript AutoFormatBuffer clang-format "proto
  "autocmd FileType java AutoFormatBuffer google-java-format
  "autocmd FileType jslayout AutoFormatBuffer jslfmt
  "autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType python AutoFormatBuffer pyformat
  "autocmd FileType dart AutoFormatBuffer dartfmt

  "Glug syntastic-google
  "Glug blazedeps auto_filetypes=go,
  "Glug youcompleteme-google

  Glug blaze plugin[mappings]='<leader>b'
  Glug codefmt gofmt_executable=goimports
  Glug codefmt-google auto_filetypes+=BUILD,go auto_all=0
  Glug grok
  Glug gtimporter
  Glug relatedfiles plugin[mappings]=',f'
  Glug ultisnips-google
  "source /usr/share/vim/google/gtags.vim
else
  "Plugin 'Valloric/YouCompleteMe'
  Plugin 'scrooloose/syntastic'
endif

" # Plugins

" ## vim-autoclose

" Otherwise it will install some mapping starting with <esc> which delay going back to normal mode.
let g:AutoClosePreserveDotReg = 0

" ## vim-go

let g:go_disable_autoinstall = 1
let g:go_gocode_bin="gocode"
let g:go_goimports_bin="goimports"
let g:go_oracle_bin="oracle"
let g:go_golint_bin="golint"

" ## Rainbow

let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['blue', 'yellow', 'white', 'red', 'magenta']

" let g:racer_cmd = '$HOME/.vim/bundle/racer/target/release/racer'

" Otherwise code block delims are completely hidden.
let g:pandoc#syntax#conceal#blacklist = ['codeblock_delim', 'strikeout', 'block', 'quotes', 'definition', 'inlinecode']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ["ruby", "php"],
      \ "passive_filetypes": ["puppet"] }
let g:syntastic_scss_checkers = ['scss_lint']

" ## GitGutter

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ## NerdCommenter

" <C-_> is the same as <C-/>
nnoremap <C-_> :call NERDComment('n', 'toggle')<CR>
" gv to highlight previous selection
vnoremap <C-_> :call NERDComment('n', 'toggle')<CR>gv

autocmd BufNewFile,BufRead *.sql let b:vimpipe_command='dremel'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#073642 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#073642 ctermbg=0

" ## org-mode
let g:org_todo_keywords = ['TODO', 'STARTED', 'DONE']
let g:org_todo_keyword_faces = [
      \  ['TODO', 'red', ':background white'],
      \  ['STARTED', 'cyan'],
      \  ['DONE', 'green']
      \]

let g:org_todo_setup = 'TODO STARTED | DONE'
hi! DONETODO guifg=green
hi! NOTDONETODO guifg=red

augroup org
  autocmd!
  autocmd FileType org nmap <CR> @<Plug>OrgNewHeadingBelowNormal
augroup END

" # Autocommands

autocmd BufNewFile,BufRead *.asm set filetype=nasm
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.org set filetype=org
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.rules set filetype=udevrules
autocmd BufNewFile,BufRead *.sql set filetype=mysql

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType borg setlocal textwidth=80
autocmd FileType css setlocal textwidth=80
autocmd FileType gcl setlocal textwidth=80
autocmd FileType markdown setlocal textwidth=80
autocmd FileType pandoc setlocal textwidth=80
autocmd FileType help setlocal textwidth=80
autocmd FileType sh setlocal textwidth=80
autocmd FileType dart setlocal textwidth=80
autocmd FileType proto setlocal textwidth=80
autocmd FileType python setlocal textwidth=80
autocmd FileType scss setlocal textwidth=80
autocmd FileType xml setlocal textwidth=80
autocmd FileType git5message setlocal textwidth=0

autocmd FileType nasm setl expandtab | setl softtabstop=0 | setl shiftwidth=4 | setl tabstop=4
autocmd FileType go setl noexpandtab | setl softtabstop=0 | setl shiftwidth=8 | setl tabstop=8
autocmd FileType html setl expandtab | setl softtabstop=0 | setl shiftwidth=2 | setl tabstop=2
autocmd FileType xml setl expandtab | setl softtabstop=0 | setl shiftwidth=2
autocmd FileType arduino setl expandtab | setl softtabstop=0 | setl shiftwidth=2

autocmd BufWrite *.dart :Autoformat
autocmd BufWrite *.go :Autoformat
autocmd BufWrite *.rust :Autoformat

" # Settings

function! EnsureDir(dir)
  if isdirectory(a:dir) == 0
    execute 'silent !mkdir -p ' . a:dir
  endif
endfunction

scriptencoding utf-8

set guifont=Ubuntu\ Mono\ 14
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set mouse=a     " automatically enable mouse usage

set backup       " backups are nice ...
call EnsureDir('~/.vim/backup')
call EnsureDir('~/.vim/swap')
call EnsureDir('~/.vim/views')
call EnsureDir('~/.vim/undo')
set backupdir=~/.vim/backup " but not when they clog .
" For crontab -e editing
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/swap  " Same for swap files
set viewdir=~/.vim/views  " same but for view files
set undodir=~/.vim/undo
set noautochdir

set textwidth=100 "0
set history=1000
set undofile
set undolevels=1000
set undoreload=10000

set foldenable
set foldmethod=syntax
set foldlevel=9999
set foldlevelstart=9999
set foldcolumn=4

set updatetime=1000

set tabpagemax=15 " only show 15 tabs
set showmode " display the current mode
set laststatus=2 " Always show statusline

set splitright
set splitbelow

set backspace=indent,eol,start " backspace for dummys
set cino-=(0 "do not align to open parenthesis
set linespace=0 " No extra spaces between rows
set number " Line numbers on
set winminheight=0 " windows can be 0 line high

set listchars=tab:»\ ,trail:·
set list

set cursorline      " highlight current line

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

set viminfo='1000,f1

set noesckeys    " disable keys sending escape sequences in insert mode (fixes delay after pressing ESC in terminal)

set diffopt=filler,vertical

" Complete only the current buffer and includes
set complete=.,i

" Complete options (disable preview scratch window)
" Note that these are normally overridden by YCM.
set completeopt=menu,menuone,longest
"inoremap <expr> <Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

set timeoutlen=1000
set ttimeoutlen=0

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

set formatoptions-=t " don't reflow 'normal' text.
set formatoptions-=o " do not insert comment leader after o or O

"set formatoptions+=a " Automatically reflow text (only comments if c is set)
set formatoptions+=l " don't break long lines in insert mode
set formatoptions+=c " wrap comments
set formatoptions+=r " insert comment leader after <enter>
set formatoptions+=j " remove comment leader when joining lines

set shm+=A " no warnings about swap files

set viewoptions=cursor,folds
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

set t_Co=16
set background=dark     " Assume a dark background
let g:solarized_termcolors=16
let g:solarized_contrast='high'
let g:solarized_diffmode='high'    "default value is normal
colorscheme solarized

" # Key mappings

" Stupid shift key fixes
cnoremap W w
cnoremap wQ wq
cnoremap WQ wq
cnoremap wQ wq
cnoremap Q q
cnoremap Tabe tabe

" Strip leading '//' from paths (e.g. '//depot...' in borgcfg).
set includeexpr=substitute(v:fname,'//','')

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

" jj to normal mode
inoremap jj <Esc>

noremap [[ ?{<CR>w99[{
noremap ][ /}<CR>b99]}
noremap ]] j0[[%/{<CR>
noremap [] k$][%?}<CR>

" Easier moving in tabs and windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h
noremap <C-K> <C-W>k
noremap <S-H> gT
noremap <S-L> gt

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Reselect visual block after indent.
" vnoremap < <gv
" vnoremap > >gv

" Force saving files that require root permission
cnoremap w!! %!sudo tee > /dev/null %

" ## Eclim
" Import whatever is needed for current line.
nnoremap <silent> <LocalLeader>ji :JavaImport<cr>
" Open javadoc for statement in browser.
nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
" Search context for statement.
"    nnoremap <silent> <cr> :JavaSearchContext<cr>
" Validate current java file.
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" Show corrections for the current line of java.
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimLoggingDisabled = 1

set wildignore+=*/READONLY/*,*/blaze-*,*/magicjar/*

" ## FZF
" https://github.com/junegunn/fzf/wiki/Examples-(vim)

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffer<CR>

" ## Airline

let g:airline_left_sep = ''
let g:airline_right_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_right_sep = '«'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Too noisy for google3
let g:airline#extensions#whitespace#enabled = 0

let g:airline_section_b = airline#section#create(['hunks'])

" ## Go

" Show Go identifier under cursor instead of tagbar section.
let s:go_last_lookup_time = 0
let s:go_last_lookup_value = ''
function! GoI()
  if s:go_last_lookup_time != localtime()
    let s:go_last_lookup_value = go#complete#GetInfo()
    let s:go_last_lookup_time = localtime()
  endif
  return s:go_last_lookup_value
endfunction

function! AirlineGoInit()
  call airline#parts#define_function('go', 'GoI')
  let g:airline_section_x = airline#section#create_right(['go', 'filetype'])
endfunction
"autocmd FileType go call AirlineGoInit()

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'z', 'warning' ]
      \ ]

" ## Tagbar

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

" ## Netrw

"let g:netrw_altv=1
" What's wrong here?
let g:netrw_liststyle=3
"let g:netrw_preview=1
"let g:netrw_browse_split=4
let g:netrw_winsize=30
let g:netrw_special_syntax=1
let g:netrw_maxfilenamelen=40

" ## Ultisnips

let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsSnippetsDir='~/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'mysnippets']

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

  " $P4DIFF is called with ': $OLD1 $NEW1 : $OLD2 $NEW2 ...' as args
  " First we strip out all the : arguments
  argdelete *:

  " Then we pair up everything else in tabs with vertical diff splits
  exe 'silent edit ' . fnameescape(argv(0))
  exe 'silent vertical diffsplit ' . fnameescape(argv(1))
  wincmd =

  let s:idx = 2
  while s:idx < argc()
    tabnew
    exe 'silent edit ' . fnameescape(argv(s:idx))
    exe 'silent vertical diffsplit ' . fnameescape(argv(s:idx + 1))
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

if exists('+colorcolumn')
  set colorcolumn=100
  set colorcolumn=+0
else
  highlight OverLength ctermbg=red ctermfg=white guibg=red
  match OverLength /\%101v.\+/
endif

" Only show cursorline in active buffer.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup AutoDiffUpdate
  au!
  autocmd InsertLeave * if &diff | diffupdate | endif
augroup END

if has('cmdline_info')
  set noruler                   " show the ruler
  "  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set rulerformat=%50(%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P\ %)" a statusline, also on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

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

" ## YouCompleteMe

let g:ycm_filetype_blacklist = {
      \ 'git5message' : 1,
      \ 'mail' : 1,
      \ 'markdown' : 1,
      \ 'notes' : 1,
      \ 'qf' : 1,
      \ 'proto' : 1,
      \ 'tagbar' : 1,
      \ 'text' : 1,
      \ 'unite' : 1,
      \ 'vimwiki' : 1,
      \}

"autocmd FileType html set formatoptions+=a
"autocmd FileType html set textwidth=80
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
"set lcs=tab:??,trail:?,extends:>,precedes:<,nbsp:&

"set completeopt+=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 10
let g:ycm_dart_bin_folder_path = '/usr/lib/google-dartlang/bin'

" Turn off Syntastic gutter markers
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1

" Highlight errors and warnings with red/magenta undercurl
hi SpellBad term=none ctermbg=none cterm=undercurl ctermfg=Red gui=undercurl guisp=Red
hi SpellCap term=none ctermbg=none cterm=undercurl ctermfg=Magenta gui=undercurl guisp=Magenta

" Use C-] to jump to definition
nmap :YcmCompleter GoToDefinition

let g:ycm_semantic_triggers =  {
      \ 'c' : ['->', '.'],
      \ 'dart' : ['.'],
      \ 'objc' : ['->', '.'],
      \ 'ocaml' : ['.', '#'],
      \ 'cpp,objcpp' : ['->', '.', '::'],
      \ 'perl' : ['->'],
      \ 'php' : ['->', '::'],
      \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir' : ['.'],
      \ 'go' : ['.'],
      \ 'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
      \ 'ruby' : ['.', '::'],
      \ 'rust' : ['.', '::'],
      \ 'lua' : ['.', ':'],
      \ 'erlang' : [':'],
      \ }

" ## ShowMarks

let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'"
" For marks a-z
highlight ShowMarksHLl ctermbg=black ctermfg=red
" For marks A-Z
highlight ShowMarksHLu ctermbg=black ctermfg=darkred
" For all other marks
highlight ShowMarksHLo ctermbg=black ctermfg=cyan
" For multiple marks on the same line.
highlight ShowMarksHLm ctermbg=black ctermfg=white

" Use terminal background.
highlight Normal ctermbg=None

" FIXME
" autocmd WinEnter * highlight Normal ctermbg=None
" autocmd WinLeave * highlight Normal ctermbg=2

" Popup menu hightLight Group
"hi Pmenu ctermfg=black ctermbg=Lightgray
"hi PmenuSel ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuSbar ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuThumb ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" ## AutoClose

let g:AutoClosePairs_del = '{}'

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo 'Wrap OFF'
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
    echo 'Wrap ON'
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

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ## Eclim

let g:EclimJavaImportPackageSeparationLevel = 1
let g:EclimJavaCompleteCaseSensitive = 1
let g:EclimBrowser='open'
let g:EclimCompletionMethod='omnifunc'
"noremap <C-]> :JavaSearch<CR>

" Offer to reload the file if it changed.
autocmd BufEnter * checktime
set autoread " should do it without prompting

function! DoGit5Diff()
  let s:revision = system('git5 status --base')
  exe "Gdiff " . s:revision
endfunction
command! G5diff call DoGit5Diff()

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

" Prevent replacing paste buffer on paste.
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

function! RunTerminal()
  let line = getline('.')
  execute "silent !tmux send-keys -t '.+' '" . line . "' ENTER"
  redraw!
endfunction
autocmd FileType sh nnoremap <CR> :call RunTerminal()<CR>

function! ExtraJavaSyntax()
  set conceallevel=1
  set concealcursor=nci
  " TODO: git merge markers.
  syntax match _JavaAngleOpenClose '<[a-zA-Z., ?<>]*>' contains=_JavaAngleOpen,_JavaAngleClose
  syntax match _JavaAngleOpen '<' conceal contained cchar=⟨
  syntax match _JavaAngleClose '>' conceal contained cchar=⟩
  highlight link _JavaAngleOpen Special
  highlight link _JavaAngleClose Special

  syntax match _JavaClassName '\<[A-Z][A-Za-z0-9_]*\>'
  highlight link _JavaClassName Identifier

  syntax match _JavaConstant '\<[A-Z_]*\>'
  highlight link _JavaConstant Constant
endfunction
autocmd! FileType java call ExtraJavaSyntax()
