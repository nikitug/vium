"
" ## General
"

set nocompatible " disable vi compatibility

call pathogen#infect('~/.vim/bundle/colors')
call pathogen#infect('~/.vim/bundle/tools')
call pathogen#infect('~/.vim/bundle/langs')

set shell=/bin/bash\ -i

" Backups
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

syntax enable
set modelines=0        " Prevent security exploits http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set nohidden           " Do not let to change buffers without saving
set autoread           " Automatically reload changes if detected
set history=700        " Number of things to remember in history
set undolevels=700     " More undo levels
set confirm            " Confirmation instead of fails on e.g. :q
set clipboard+=unnamed " Yanks go on clipboard instead
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command
set foldlevelstart=99  " No folds closed on start
set showmode           " Show mode at the bottom
set ttyfast

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



"
" ## User Interface
"

if has('gui_macvim')
  set guifont=Monaco:h15

  " Use option (alt) as meta key.
  set macmeta
elseif has("gui_gtk2")
  set guifont=Monaco\ 12
endif

if has("gui_running")
  " TODO check
  "set guioptions=egmrt
  set guioptions=ai
endif

" set window title to 'titlestring' or to: filename [+=-] (path) - VIM
set title

" Colorscheme
set background=dark
if version >= 700 && &term != 'cygwin' && !has('gui_running')
  " In the color terminal, try to use CSApprox.vim plugin or
  " guicolorscheme.vim plugin if possible in order to have consistent
  " colors on different terminals.
  "
  " Uncomment one of the following line to force 256 or 88 colors if
  " your terminal supports it. Or comment both of them if your terminal
  " supports neither 256 nor 88 colors. Unfortunately, querying the
  " number of supported colors does not work on all terminals.
  set t_Co=88
  set t_Co=256
  if &t_Co == 256 || &t_Co == 88
    " Check whether to use CSApprox.vim plugin or guicolorscheme.vim plugin.
    if has('gui') &&
      \ (filereadable(expand("$HOME/.vim/plugin/CSApprox.vim")) ||
      \  filereadable(expand("$HOME/vimfiles/plugin/CSApprox.vim")))
      let s:use_CSApprox = 1
    elseif filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim")) ||
      \    filereadable(expand("$HOME/vimfiles/plugin/guicolorscheme.vim"))
      let s:use_guicolorscheme = 1
    endif
  endif
endif
if exists('s:use_CSApprox')
  " Can use the CSApprox.vim plugin.
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
  colorscheme twilight_n
elseif exists('s:use_guicolorscheme')
  " Can use the guicolorscheme plugin. It needs to be loaded before
  " running GuiColorScheme (hence the :runtime! command).
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme twilight_n
else
  colorscheme twilight_n
endif

" Default size of window
set columns=120
set lines=50

set anti            " Antialias font
set ruler           " Ruler on
set nu              " Line numbers on
set nowrap          " Line wrapping off
set laststatus=2    " Always show the statusline
set cmdheight=1
set encoding=utf-8

" Commands autocomplete options
set wildmode=list:longest,full
set wildmenu        " Turn on WiLd menu

set showmatch       " Show matching brackets.
set matchtime=2     " How many tenths of a second to blink
set showcmd         " Show command in the last line
"set scrolloff=3     " Keep at least 3 lines above and below the cursor
set showtabline=1   " Show tabline only if there are at least two tab pages
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



"
" ## Text Formatting
"

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start " make backspace work like most other apps
set cindent
set autoindent
set smarttab
set linespace=1     " space between lines
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



"
" ## Folding
"

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



"
" ## Spellcheck
"

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



"
" ## Statusline
"

function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes . "B"
  else
    return (bytes / 1024) . "K"
  endif
endfunction

set laststatus=2                     " always show the status bar
set statusline=\ 
set statusline+=%n:\                 " buffer number
set statusline+=%t                   " filename with full path
set statusline+=%m                   " modified flag
set statusline+=\ \ 
set statusline+=%{&paste?'[paste]\ ':''}
set statusline+=%{&fileencoding}
set statusline+=\ \ %Y               " type of file
set statusline+=\ \ %3.3(%c%)          " column number
set statusline+=\ %3.9(%l/%L%)     " line / total lines
set statusline+=[%2.3p%%]            " [percentage]
set statusline+=\ \ %{FileSize()}
set statusline+=%<                   " where truncate if line too long
set statusline+=\ \ %{expand('%:p:~')}



"
" ## Bindings
"

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

set pastetoggle=<Leader>p

" Fixes common typos
command! W w
command! Q q
map <F1> <Esc>
imap <F1> <Esc>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! w !sudo tee % >/dev/null

" double percentage sign in command mode is expanded
" to directory of current file
cnoremap %% <C-R>=expand('%:p').'/'<cr>

" Opens file under cursor in new split
nmap gf :vertical wincmd f<CR>

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

" Make line completion easier
" key <C-l> full line completion
imap <C-l> <C-x><C-l>

" Toggle spelling mode with ,s
" key <,sp> toggle spell
nmap <silent> <leader>sp :set spell!<CR>

" Search and replase in all buffers http://vim.wikia.com/wiki/VimTip382
" key <,r> search and replace in all buffers
function! Replace()
  let s:word = input("Replace " . expand('<cword>') . " with:")
  :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
  :unlet! s:word
endfunction
map <Leader>r :call Replace()<CR>

" Clear the search highlight in Normal mode
" key <Esc><Esc> no hilight search
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" key <,p> toggle paste mode
" key <,s> :%s##
nnoremap <leader>s :%s##<left>

" Move lines
" check tpope's ]e [e http://www.vim.org/scripts/script.php?script_id=1590
" key <C-{k,j}> move lines up/down
nmap <C-k> ddkP
nmap <C-j> ddp
vmap <C-k> xkP'[V']
vmap <C-j> xp'[V']


" key <,ev> edit my vimrc
nmap <leader>ev :tabedit $MYVIMRC<CR>

" key <,rv> reload vimrc
nmap <leader>rv :so $MYVIMRC<CR>

" key <,y> yank line without indents
nnoremap ,y ^yg_"_dd

" key <,ws> fix trailing white space
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Check: https://github.com/jeetsukumaran/vim-buffergator
" key <,bl> show buffers
nmap <Leader>bl :ls<cr>:b

" key <,bp> prev buffer
nmap <Leader>bp :bp<cr>

" key <,bn> next buffer
nmap <Leader>bn :bn<cr>

" key <gU> <gu> change case

" key <c-e> move to the end of line
" key <c-a> move to the begining of the line
cnoremap <c-e> <end>
imap     <c-e> <c-o>$
map      <c-e> $
cnoremap <c-a> <home>
imap     <c-a> <c-o>^
map      <c-a> ^

" key <,ul> underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" key <,tw> set text wrapping toggles
nmap <silent> <leader>tw :set invwrap wrap?<CR>

" key <,fc> find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" key <,hs> toggle hlsearch with
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" key <,<space>> clean search hl
nmap <leader><space> :noh<cr>

" key <,fef> reformat the entire file
nmap <leader>fef mQggVG=`Q

" key <,cd> cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" key <,mk> create the directory containing the file in the buffer
nmap <silent> <leader>mk :!mkdir -p %:p:h<CR>

" key <+> fold code till matched bracket
map + v%zf

" use <tab> to match brackets
nnoremap <tab> %
vnoremap <tab> %

" key <,v> reselect pasted text
nnoremap <leader>v V`]

" key <,gr> go run %
nmap <leader>gr :w<CR>:!go run %<TAB><CR>

" key <c-tab>, <c-s-tab> cycle tabs forward and backward
nmap <c-tab> :tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>

" key <c-#> switches to tab
nmap <d-1> 1gt
nmap <d-2> 2gt
nmap <d-3> 3gt
nmap <d-4> 4gt
nmap <d-5> 5gt
nmap <d-6> 6gt
nmap <d-7> 7gt
nmap <d-8> 8gt
nmap <d-9> 9gt


"
" ## Auto Commands
"

if has("autocmd")
  " Autosave all buffers
  autocmd FocusLost silent! :wa

  " reload .vimrc, .gvimrc, .vimrc.after and so on
  autocmd BufWritePost .?vimrc* source $MYVIMRC

  " Resize splits when the window is resized
  autocmd VimResized * wincmd =

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost *
        \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif



"
" ## File Types
"

filetype plugin indent on  " automatically detect file types

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  autocmd FileType make set noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  autocmd BufNewFile,BufRead *.lxbuilder set ft=ruby

  autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType php set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType java set softtabstop=4 tabstop=4 shiftwidth=4

  autocmd FileType go set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType godoc set softtabstop=8 tabstop=8 shiftwidth=8 noexpandtab

  if has('multi_byte')
    if version >= 700
      autocmd FileType go set listchars=tab:\ \ ,trail:·,extends:❯,precedes:❮,nbsp:×
    endif
  endif
endif



"
" ## Plugins
"

exe "source " . fnamemodify(resolve($MYVIMRC), ":p:h") . "/vium/plugins.vim"
