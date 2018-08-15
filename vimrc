set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Tools
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'              " :Gblame etc.
Plugin 'scrooloose/nerdtree'             " <Bs>
Plugin 'majutsushi/tagbar'               " <D-Bs>
Plugin 'tpope/vim-endwise'               " smart `end` apptender
Plugin 'tmhedberg/matchit'               " % improver
Plugin 'mileszs/ack.vim'                 " :Ack
Plugin 'tpope/vim-surround'              " <cs'">, <ysiw'>, <ds'>
Plugin 'tpope/vim-repeat'                " . improver
Plugin 'w0rp/ale'                        " async syntax checker
Plugin 'godlygeek/tabular'               " :Tab /=\zs
Plugin 'scrooloose/nerdcommenter'        " <,c >
" Plugin 'junegunn/fzf.vim'              " unusable yet comparing to ctrlp
Plugin 'ctrlpvim/ctrlp.vim'              " <,t>
Plugin 'j5shi/ctrlp_bdelete.vim'         " <c-@> to close buffer in CtrlP
Plugin 'michaeljsmith/vim-indent-object' " indent text object, <ii>
Plugin 'farmergreg/vim-lastplace'        " open files in last edited place
Plugin 'haya14busa/incsearch.vim'        " better incremental search
Plugin 'haya14busa/incsearch-fuzzy.vim'  " <leader-/> fuzzy search
Plugin 'ap/vim-css-color'                " background for colors like #000
Plugin 'rizzatti/dash.vim'               " Dash.app commands
Plugin 'airblade/vim-gitgutter'          " shows git changes
Plugin 'sjl/gundo.vim'                   " undo tree :Gundo
Plugin 'tpope/vim-projectionist'         " configure alternate files etc.
Plugin 'Shougo/deoplete.nvim'            " complete engine
Plugin 'zchee/deoplete-go', { 'do': 'make'}
Plugin 'roxma/nvim-yarp'                 " required for deoplete
Plugin 'roxma/vim-hug-neovim-rpc'        " required for deoplete
Plugin 'tpope/vim-unimpaired'            " [b ]b etc.
Plugin 'tpope/vim-rhubarb'               " :Gbrowse opens in GitHub
Plugin 'vim-airline/vim-airline'         " status line
Plugin 'kshenoy/vim-signature'           " marks highlight and navigation, <ma> <'a>

" Colors http://vimcolors.com/
Plugin 'jaywilliams/vim-vwilight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'cocopon/iceberg.vim'

" Languages
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-cucumber'
Plugin 'thoughtbot/vim-rspec'
Plugin 'pearofducks/ansible-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'ekalinin/Dockerfile.vim'

call vundle#end()
filetype plugin indent on

set encoding=utf-8

" Backups
set backup
set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,/var/tmp,/tmp

syntax enable
set modeline           " Modelines (comments that set vim options on a per-file basis)
set nohidden           " Do not let to change buffers without saving
set autoread           " Automatically reload changes if detected
set history=1000       " Number of things to remember in history
set undolevels=700     " More undo levels
set confirm            " Confirmation instead of fails on e.g. :q
set clipboard+=unnamed " Yanks go on clipboard instead
set autowrite          " Writes on make/shell commands
set timeoutlen=500     " Time to wait for a command
set foldlevelstart=99  " No folds closed on start
set showmode           " Show mode at the bottom
set infercase          " Completion recognizes capitalization
set shortmess+=A       " Don't bother me when a swapfile exists
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
  set guifont=Hack:h17
  " set linespace=-3 " fix Inconsolata LGC
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
set termguicolors
colorscheme hybrid

set anti                " Antialias font
set ruler               " Show row/col and percentage
set number              " Line numbers on
set nowrap              " Line wrapping off
set laststatus=2        " Always show the statusline
set cmdheight=1
set signcolumn=yes

" Disable balloon hints on mouseover
set noballooneval
let g:netrw_nobeval = 1
let g:ale_set_balloons = 0

" Commands autocomplete options
set wildmode=list:longest,full
set wildmenu        " Turn on WiLd menu

set showmatch       " Show matching brackets.
set matchtime=2     " How many tenths of a second to blink
set showcmd         " Show command in the last line
set showtabline=2   " Show tabline only if there are at least two tab pages
set cursorline      " color current line
set gcr=n:blinkon0  " do not blink cursor in normal mode

set colorcolumn=120
set undofile

" new splits below and right
set splitbelow
set splitright

" Menu items
menu Encoding.UTF-8 :e ++enc=utf8<CR>
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
set cindent " Automatic program indenting
set autoindent " Carry over indenting from previous line
set smarttab
set wrap            " http://vimcasts.org/episodes/soft-wrapping-text/
set linebreak       " Break long lines by word, not char
set list            " display unprintable characters
set listchars=tab:▸\ ,extends:›,precedes:‹,nbsp:×,trail:· " Unicode characters for various things
set formatoptions=crqln1   " :h fo-table

" Show ↪ at the beginning of wrapped lines
if has("linebreak")
  let &sbr = nr2char(8618).' '
endif

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd WinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" key `<za>` -- open/close current fold
" key `<{zM,zR}>` -- open/close all folds
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
  " menu Spell.Word\ Suggest<Tab>z= z=
  " menu Spell.Previous\ Wrong\ Word<Tab>[s [s
  " menu Spell.Next\ Wrong\ Word<Tab>]s ]s
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
map Q  <silent>
map q: <silent>

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

" key `Tab` -- switch between current/prev buffers
nnoremap <Tab> <C-^>

" key `K` -- search word under cursor with Ag
nnoremap K :silent! Ack! -i "\b<cword>\b"<cr>

" key `<C-{k,j}>` -- move lines up/down
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
" cmd `<:w!!>` -- write as sudo
cmap w!! w !sudo tee % >/dev/null

" double percentage sign in command mode is expanded
" to directory of current file
" cmd `<%%>` -- current file directory
cnoremap %% <C-R>=expand('%:p').'/'<cr>

" show generated vimrc doc
command! Mydoc :!$HOME/.vim/gen_doc.sh \|more

" key `<,<space>>` -- clean search hl and save the buffer
nmap <leader><space> :nohlsearch<cr>
" key `<Enter>` -- clean search hl and save the buffer
nmap <cr> :nohlsearch<cr>:w<cr>

" key `<,sp>` -- toggle spelling mode
nmap <leader>sp :set spell! spelllang=ru,en spell?<CR>

" key `<,w>` -- toggle wrapping
nmap <silent> <leader>w :set invwrap wrap?<CR>

" key `<,hs>` -- toggle hlsearch with
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" key `<,p>` -- toggle paste mode
nmap <leader>p :set paste! paste?<cr>

" key `<,s>` -- :%s##
nnoremap <leader>s :%s##<left>

" key `<,W>` -- fix trailing white space
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" key `<,mk>` -- create the directory containing the file in the buffer
nmap <silent> <leader>mk :!mkdir -p %:p:h<CR>

" key `<,ft>` -- format markdown table
map <leader>ft V{jo}k:s/----*/---/g<CR>gv:Tabularize /\|<CR>j:s/\(\s*\)\(:\)\?\(-*\)\(:\)\?\(\s*\)/\2\1\3\5\4/g<CR>:s/\s/-/g<CR>gv:s/---$/-----------/<CR>:noh<CR>

" ctags
" TODO: check out https://github.com/junegunn/fzf/issues/243
" ket `<t>` -- next tag match
nmap t <C-]>
" ket `<T>` -- previous tag match
nmap T :pop<CR>

"""" Experimental

" key `<U=>` -- underline the current line with '='
nmap <silent> U= YpVr=<cr>
" key `<U">` -- underline the current line with '"'
nmap <silent> U" YpVr"<cr>
" key `<Ur>` -- update underline
nmap <silent> Ur jvyddkYpVr"<cr>

" key `<,ev>` -- edit my vimrc
nmap <leader>ev :tabedit $MYVIMRC<CR>
" key `<,rv>` -- reload vimrc
nmap <leader>rv :so $MYVIMRC<CR>

" key `<,fef>` -- reformat the entire file
" nmap <leader>fef mQggVG=`Q

" key `<+>` -- fold code till matched bracket
map + v%zf

" key `<,v>` -- reselect pasted text
nnoremap <leader>v V`]

"""" Tabs/buffers navigation

" key `<c-#>` -- switches to tab
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
  autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt,md.erb} setf markdown
  autocmd BufNewFile,BufRead *.md.erb set ft=markdown

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType php set softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType java set softtabstop=4 tabstop=4 shiftwidth=4

  " Ruby
  " key `<,r>` -- (ft=ruby) .Rake
  " key `<,R>` -- (ft=ruby) Rake
  " key `<,rr>` -- (ft=ruby) !ruby %
  autocmd FileType ruby nmap <buffer> <leader>r :w<CR>:.Rake<CR>
  autocmd FileType ruby nmap <buffer> <leader>R :w<CR>:Rake<CR>
  autocmd FileType ruby nmap <buffer> <leader>rr :w<CR>:!ruby %<TAB><CR>

  " Golang
  autocmd FileType go set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType godoc set softtabstop=8 tabstop=8 shiftwidth=8 noexpandtab
  " key `<,R>` -- (ft=go) !go run %
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

""" Ack
nnoremap <expr> <leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ack!<space>"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""" FZF
" set rtp+=/usr/local/opt/fzf
" map <leader>t :Files<CR>

""" CtrlP
let g:ctrlp_map = '<leader>t'
nnoremap <silent> <expr> <leader>t (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":CtrlP\<cr>"
nnoremap <silent> <leader>T :CtrlPTag<cr>
map <space> :CtrlPBuffer<cr>
let g:ctrlp_extensions = ['tag']
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
call ctrlp_bdelete#init()

""" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

""" Deoplete
if has('python3')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#disable_auto_complete = 1
  " let g:deoplete#enable_auto_select = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_yarp = 1

  " let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  " let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  inoremap <silent><expr><tab>
        \ pumvisible() ? "\<c-n>" :
        \ <sid>check_back_space() ? "\<tab>" :
        \ deoplete#mappings#manual_complete().deoplete#mappings#manual_complete()
  inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  inoremap <silent><expr><bs> pumvisible() ? deoplete#smart_close_popup() : "\<bs>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
endif

""" Airline
let g:airline#extensions#ale#enabled = 1

""" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <leader>/ :call incsearch#call(incsearch#config#fuzzy#make())<cr>

""" Gundo
command! Gundo :GundoToggle

"""" Git
command! GdiffInTab tabedit %|Gdiff
" key `<,D>` -- Git diff in tab
nnoremap <leader>D :GdiffInTab<cr>

"""" CSApprox
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

"""" SnipMate
imap <C-Space> <Plug>snipMateNextOrTrigger
smap <C-Space> <Plug>vnipMateNextOrTrigger

"""" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"""" TagBar
" key `<C-Bs>` -- toggle tagbar
map <silent> <D-Bs> :TagbarToggle<CR>:set noballooneval<CR>

"""" GitGutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

"""" Tex
map <C-S-space> <Plug>IMAP_JumpForward

"""" Powerline
let g:Powerline_stl_path_style = 'short'

"""" Haste
" command `Haste` pastes lines to hastebin
command! -range=% Haste <line1>,<line2>w !haste | tee >(pbcopy)

"""" JSON Prettyfy
" command `Json` prettifies JSON
command! Json %!ruby -rjson -e 'puts JSON.pretty_generate(JSON.parse(STDIN.read))'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" key `<Backspace>` -- toggle NERDTree
nnoremap <Bs> :NERDTreeToggle<CR>
" key `<S-Backspace>` -- ':NERDTree ' prompt
nnoremap <S-Bs> :NERDTree  "
" key `<,Backspace>` -- :NERDTreeFind find current file in NERDTree
nnoremap <leader><Bs> :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o', '\~$']
let NERDTreeHijackNetrw = 0
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

if has('autocmd')
  " exit nerdtree if it's the only window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  augroup AuNERDTreeCmd
  autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" HEX Editor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hex mode from http://vim.wikia.com/wiki/Improved_hex_editing
" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
