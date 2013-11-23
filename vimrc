""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " disable vi compatibility

call pathogen#infect('~/.vim/bundle/colors')
call pathogen#infect('~/.vim/bundle/tools')
call pathogen#infect('~/.vim/bundle/langs')

set shell=/bin/bash\ -i
set encoding=utf-8

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

syntax enable
set modeline           " Modelines (comments that set vim options on a per-file basis)
set nohidden           " Do not let to change buffers without saving
set autoread           " Automatically reload changes if detected
set history=10000      " Number of things to remember in history
set undolevels=700     " More undo levels
set confirm            " Confirmation instead of fails on e.g. :q
set clipboard+=unnamed " Yanks go on clipboard instead
set autowrite          " Writes on make/shell commands
set timeoutlen=500     " Time to wait for a command
set foldlevelstart=99  " No folds closed on start
set showmode           " Show mode at the bottom
set ttyfast
set diffopt+=iwhite

" Searching
set ignorecase  " Case insensitive search
set smartcase   " Non-case sensitive search if contains upper
set incsearch   " While typing a search command, show show where the pattern
set hlsearch    " Enable search highlighting
nohlsearch      " but do not highlight last search on startup
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class
set wildignore+=*.DS_Store

" Disable Sounds
set noerrorbells
set novisualbell
set t_vb=

" Mouse
set mousehide   " Hide mouse after chars typed
set mouse=a     " Mouse in all mode
set mouseshape=s:udsizing,m:no " turn to a sizing arrow over the status liness

" Complete options
set complete+=U



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set linespace=1    " in pixels
if has('gui_macvim')
  set guifont=Inconsolata\ LGC:h14
  set linespace=-3 " fix Inconsolata LGC
  set macmeta      " Use option (alt) as meta key.
elseif has("gui_gtk2")
  set guifont=Inconsolata\ LGC\ 12
endif

if has("gui_running")
  set guioptions=ai
endif

" set window title to 'titlestring' or to: filename [+=-] (path) - VIM
set title

" Colorscheme
set background=dark
colorscheme gruvbox

set anti            " Antialias font
set ruler           " Ruler on
set nu              " Line numbers on
set nowrap          " Line wrapping off
set laststatus=2    " Always show the statusline
set cmdheight=1

" Commands autocomplete options
set wildmode=list:longest,full
set wildmenu        " Turn on WiLd menu

set showmatch       " Show matching brackets.
set matchtime=2     " How many tenths of a second to blink
set showcmd         " Show command in the last line
set showtabline=2   " Show tabline only if there are at least two tab pages
set cursorline      " color current line
set gcr=n:blinkon0  " do not blink cursor in normal mode

if version >= 703
  set colorcolumn=120
  "set relativenumber
  set undofile
en

" new splits below and right
set splitbelow
set splitright

" Menu items
menu Encoding.UTF-8 :e ++enc=utf8 <CR>
menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start " make backspace work like most other apps
set cindent
set autoindent
set smarttab
set wrap            " http://vimcasts.org/episodes/soft-wrapping-text/
set linebreak
set list            " display unprintable characters
set formatoptions=crqln1   " :h fo-table

" Tab and EOL symbols
if has('multi_byte')
  if version >= 700
    set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
  else
    set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
  endif
endif

" Show ↪ at the beginning of wrapped lines
if has("linebreak")
  let &sbr = nr2char(8618).' '
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" key <za> open/close current fold
" key <{zM,zR}> open/close all folds
" from https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

set foldcolumn=0        " Folding column width
set foldmethod=manual   " Fold manually
set foldnestmax=10      " Maximum nested fold level
set nofoldenable        " Do not fold by default
set foldlevel=1         " This is just what i use
set fillchars="fold: "  " Remove the extrafills --------



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if version >= 700
  set spell spelllang=
  set nospell " Disable spell check by default

  menu Spell.off :setlocal spell spelllang= <cr>
  menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
  menu Spell.Russian :setlocal spell spelllang=ru <cr>
  menu Spell.English :setlocal spell spelllang=en <cr>
  menu Spell.-SpellControl- :
  menu Spell.Word\ Suggest<Tab>z= z=
  menu Spell.Previous\ Wrong\ Word<Tab>[s [s
  menu Spell.Next\ Wrong\ Word<Tab>]s ]s
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" Fixes common typos
command! W w
command! Q q
map <F1> <Esc>
imap <F1> <Esc>

" Reselect after indenting
vnoremap < <gv
vnoremap > >gv

" Search result always at the center
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Don't skip wrap lines
noremap j gj
noremap k gk

" Disable man search
noremap K <nop>

" key <C-{k,j}> move lines up/down
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
" cmd <:w!!> write as sudo
cmap w!! w !sudo tee % >/dev/null

" double percentage sign in command mode is expanded
" to directory of current file
" cmd <%%> current file directory
cnoremap %% <C-R>=expand('%:p').'/'<cr>

" key <,<space>> clean search hl
nmap <leader><space> :nohlsearch<cr>
" key <Esc><Esc> no hilight search
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" key <,sp> toggle spelling mode
nmap <leader>sp :set spell! spelllang=ru,en spell?<CR>

" key <,w> toggle wrapping
nmap <silent> <leader>w :set invwrap wrap?<CR>

" key <,hs> toggle hlsearch with
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" key <,p> toggle paste mode
nmap <leader>p :set paste! paste?<cr>

" key <,s> :%s##
nnoremap <leader>s :%s##<left>

" key <,W> fix trailing white space
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" key <,cd> cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" key <,mk> create the directory containing the file in the buffer
nmap <silent> <leader>mk :!mkdir -p %:p:h<CR>

"""" Experimental

" key <,=> underline the current line with '='
nmap <silent> <leader>= :t.\|s/./=/g\|:nohls<cr>

" key <,ev> edit my vimrc
nmap <leader>ev :tabedit $MYVIMRC<CR>
" key <,rv> reload vimrc
nmap <leader>rv :so $MYVIMRC<CR>

" key <,fef> reformat the entire file
nmap <leader>fef mQggVG=`Q

" key <+> fold code till matched bracket
map + v%zf

" key <,v> reselect pasted text
nnoremap <leader>v V`]

"""" Tabs/buffers navigation

" key <,bl> show buffers
nmap <Leader>bl :ls<cr>:b

" key <c-tab>, <c-s-tab> cycle tabs forward and backward
nmap <c-tab> :tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>
" key <c-#> switches to tab
nmap <d-s-1> 1gt
nmap <d-s-2> 2gt
nmap <d-s-3> 3gt
nmap <d-s-4> 4gt
nmap <d-s-5> 5gt
nmap <d-s-6> 6gt
nmap <d-s-7> 7gt
nmap <d-s-8> 8gt
nmap <d-s-9> 9gt
nmap <d-1> 1gt
nmap <d-2> 2gt
nmap <d-3> 3gt
nmap <d-4> 4gt
nmap <d-5> 5gt
nmap <d-6> 6gt
nmap <d-7> 7gt
nmap <d-8> 8gt
nmap <d-9> 9gt



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  " Autosave all buffers
  autocmd FocusLost silent! :wa

  " Resize splits when the window is resized
  autocmd VimResized * wincmd =

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost *
        \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on  " automatically detect file types

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  autocmd FileType make set noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType php set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType java set softtabstop=4 tabstop=4 shiftwidth=4

  " Ruby
  " key <,R> (ft=ruby) !ruby %
  autocmd FileType ruby nmap <buffer> <leader>R :w<CR>:!ruby %<TAB><CR>

  " Golang
  autocmd FileType go set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType godoc set softtabstop=8 tabstop=8 shiftwidth=8 noexpandtab
  " key <,R> (ft=go) !go run %
  autocmd FileType go nmap <buffer> <leader>R :w<CR>:!go run %<TAB><CR>
  if has('multi_byte')
    if version >= 700
      autocmd FileType go set listchars=tab:\ \ ,trail:·,extends:❯,precedes:❮,nbsp:×
    endif
  endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" exe "source " . fnamemodify(resolve($MYVIMRC), ":p:h") . "/vium/plugins.vim"

"""" Git
command! GdiffInTab tabedit %|Gdiff
" key <,d> Git diff in tab
nnoremap <leader>d :GdiffInTab<cr>

"""" CSApprox
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

"""" SnipMate
imap <C-Space> <Plug>snipMateNextOrTrigger
smap <C-Space> <Plug>vnipMateNextOrTrigger

"""" Ack
" key <,f> :Ack
map <leader>f :Ack<space>


"""" ZoomWin
" key <,zw> Toggle ZoomWin
map <leader>zw :ZoomWin<CR>

"""" Gundo
" key <,u> Toggle Gundo
map <leader>u :GundoToggle<CR>

"""" Kwbd
" key <C-W>! delete buffer without closing window
map <C-W>! <Plug>Kwbd

"""" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_warnings=0

"""" TagBar
" key <,ct> toggle tagbar
map <leader>ct :TagbarToggle<CR>

"""" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'find %s -type f'
"let g:ctrlp_use_caching = 0

"""" GitGutter
let g:gitgutter_enabled = 0

"""" Tex
map <C-S-space> <Plug>IMAP_JumpForward

"""" Powerline
let g:Powerline_stl_path_style = 'short'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" key <Backspace> toggle NERDTree
nnoremap <Bs> :NERDTreeToggle<CR>
" key <S-Backspace> ':NERDTree ' prompt
nnoremap <S-Bs> :NERDTree
" key <,Backspace> :NERDTreeFind find current file in NERDTree
nnoremap <leader><Bs> :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o', '\~$']
let NERDTreeHijackNetrw = 0
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

if has('autocmd')
  " exit nerdtree if it's the only window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  augroup AuNERDTreeCmd
  autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

  " If the parameter is a directory, cd into it
  function! s:CdIfDirectory(directory)
    let explicitDirectory = isdirectory(a:directory)
    let directory = explicitDirectory || empty(a:directory)

    if explicitDirectory
      exe "cd " . fnameescape(a:directory)
    endif

    " Allows reading from stdin
    " ex: git diff | mvim -R -
    if strlen(a:directory) == 0
      return
    endif

    if directory
      "NERDTree
      "wincmd p
      bd
    endif

    "if explicitDirectory
      "wincmd p
    "endif
  endfunction

  " NERDTree utility function
  function! s:UpdateNERDTree(...)
    let stay = 0

    if(exists("a:1"))
      let stay = a:1
    end

    if exists("t:NERDTreeBufName")
      let nr = bufwinnr(t:NERDTreeBufName)
      if nr != -1
        exe nr . "wincmd w"
        exe substitute(mapcheck("R"), "<CR>", "", "")
        if !stay
          wincmd p
        end
      endif
    endif

    if exists(":CommandTFlush") == 2
      CommandTFlush
    endif
  endfunction
endif
