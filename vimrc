set nocompatible
filetype off
autocmd!

set encoding=utf-8
" somehow overridden by alacritty
let &term = "xterm-256color"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Tools
Plug 'wincent/terminus'                           " Vertical bar in insert mode
" Plug 'romainl/vim-cool'                           " nohlsearch when you finished search
Plug 'mbbill/undotree'                            " Undo tree
Plug 'tmhedberg/matchit'                          " % improver
Plug 'tpope/vim-repeat'                           " . improver
Plug 'michaeljsmith/vim-indent-object'            " indent text object, <ii>
Plug 'farmergreg/vim-lastplace'                   " open files in last edited place
Plug 'haya14busa/incsearch.vim'                   " better incremental search
Plug 'haya14busa/incsearch-fuzzy.vim'             " <leader-/> fuzzy search
Plug 'tpope/vim-unimpaired'                       " [b ]b etc.
Plug 'tpope/vim-abolish'                          " <crm>, <crs>, <cru>
Plug 'kshenoy/vim-signature'                      " marks highlight and navigation, <ma> <'a>
Plug 'tpope/vim-endwise'                          " smart `end` apptender
Plug 'tpope/vim-surround'                         " <cs'">, <ysiw'>, <ds'>
Plug 'tpope/vim-fugitive'                         " Git integration
Plug 'tpope/vim-projectionist'                    " configure alternate files etc.
Plug 'lambdalisue/fern.vim'                       " file tree
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-hijack.vim'                " hijack netrw
Plug 'scrooloose/nerdcommenter'                   " <,c >
Plug 'airblade/vim-gitgutter'                     " shows git changes
Plug 'godlygeek/tabular'                          " :Tab /=\zs
Plug 'mileszs/ack.vim'                            " :Ack
Plug 'dense-analysis/ale'                         " async syntax checker
Plug 'liuchengxu/vista.vim'                       " tag tree
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " autocomplete
" Plug 'ap/vim-css-color'                           " it's slow, maybe I move it to on-demand loading; background colors for #000
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } " <space>

" Colors http://vimcolors.com/
Plug 'kristijanhusak/vim-hybrid-material'

" Languages
Plug 'janko-m/vim-test'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
" Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'pangloss/vim-javascript'
Plug 'teal-language/vim-teal'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap, Backups and Undos
" https://begriffs.com/posts/2019-07-19-history-use-vim.html#backups-and-undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" consolidate the writebackups -- not a big
" deal either way, since they usually get deleted
set backupdir=~/.vim/backup//

" persist the undo tree for each file
set undofile
set undodir=~/.vim/undo//


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FIXME: For more great topics, see these help sections: views-sessions, viminfo, TOhtml, ins-completion, cmdline-completion, multi-repeat, scroll-cursor, text-objects, grep, netrw-contents.

syntax enable
set nomodeline         " Modelines (comments that set vim options on a per-file basis)
set hidden             " Allow unsaved background buffers
set autoread           " Automatically reload changes if detected
set history=10000      " Number of things to remember in history
set undolevels=700     " More undo levels
set confirm            " Confirmation instead of fails on e.g. :q
set clipboard+=unnamed " Yanks go on clipboard instead
set autowrite          " Writes on make/shell commands
set timeoutlen=500     " Time to wait for a command
set ttimeoutlen=100
set showmode           " Show mode at the bottom
set infercase          " Completion recognizes capitalization
set shortmess+=A       " Don't bother me when a swapfile exists
set shortmess+=c       " don't give |ins-completion-menu| messages.
set updatetime=300
set ttyfast
set diffopt+=internal,algorithm:patience

" Searching
set ignorecase  " Case insensitive search
set smartcase   " Non-case sensitive search if contains upper
set incsearch   " While typing a search command, show where the pattern
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

" Russian support
set keymap=russian-jcukenwin
set iminsert=0 " Insert mode in english by default
set imsearch=0 " Search in english by default
inoremap <C-space> <C-^>
" https://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim/7725796#7725796
inoremap <C-@> <C-^>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set window title to 'titlestring' or to: filename [+=-] (path) - VIM
set title

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%{FugitiveStatusline()}%=%-19(%l/%L,%02c%03V%)

" Colorscheme
set background=dark
set termguicolors
colorscheme hybrid_changed
highlight SignColumn guibg=NONE ctermbg=NONE
highlight lCursor guifg=Cyan guibg=Cyan

set ruler           " Show row/col and percentage
set number          " Line numbers on
set nowrap          " Line wrapping off
set laststatus=2    " Always show the statusline
set cmdheight=1
set signcolumn=yes
set showmatch       " Show matching brackets.
set matchtime=2     " How many tenths of a second to blink
set showcmd         " Show command in the last line
set showtabline=2   " Show tabline only if there are at least two tab pages
set cursorline      " color current line
set colorcolumn=100

if !has('nvim')
  set anti              " Antialias font
  " Disable balloon hints on mouseover
  " neovim does not have it
  set noballooneval
  let g:netrw_nobeval = 1
  let g:ale_set_balloons = 0
end

" Commands autocomplete options
set wildmode=list:longest,full
set wildmenu        " Turn on WiLd menu

" new splits below and right
set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start " make backspace work like most other apps
set cindent     " Automatic program indenting
set autoindent  " Carry over indenting from previous line
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
set foldlevelstart=99   " No folds closed on start

let g:xml_syntax_folding=1
au FileType xml setlocal foldenable
au FileType xml setlocal foldmethod=syntax
au FileType xml setlocal foldlevel=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell spelllang=en
set nospell " Disable spell check by default


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
nnoremap K :silent! Ack! --hidden -i "\b<cword>\b"<cr>

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

" key `<,<space>>` -- clean search hl
nmap <leader><space> :nohlsearch<cr>

" key `<Enter>` -- clean search hl and save the buffer
nmap <CR> :nohlsearch<cr>:w<cr>
" fix <cr> for cmd-window
autocmd CmdwinEnter * map <buffer> <CR> <CR>

" key `<,w>` -- toggle wrapping
nmap <silent> <leader>w :set invwrap wrap?<CR>

" key `<,p>` -- toggle paste mode
nmap <leader>p :set paste! paste?<cr>

" key `<,q>` -- commands mode
nnoremap <leader>q q:

" TODO: move to command
" key `<,ft>` -- format markdown table
map <leader>ft V{jo}k:s/----*/---/g<CR>gv:Tabularize /\|<CR>j:s/\(\s*\)\(:\)\?\(-*\)\(:\)\?\(\s*\)/\2\1\3\5\4/g<CR>:s/\s/-/g<CR>gv:s/---$/-----------/<CR>:noh<CR>

" TODO: move to command
" key `<,f,>` -- tabularize commas
map <leader>f, V{jo}k:Tabularize/,\zs/l0l1<CR>

" key `<R>` -- replace word with clipboard content
nmap R viw"_s<ESC>p
vmap R "_s<ESC>p

" ctags
" TODO: check out https://github.com/junegunn/fzf/issues/243
" ket `<t>` -- next tag match
nmap t <C-]>
" ket `<T>` -- previous tag match
nmap T :pop<CR>

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

" mapped to Command-] in alacritty
nmap <c-s> gt
nmap <c-q> gT

" Next quickfix file
nmap <leader>n :cn<CR>

" Copies filename to clipboard
command! CopyFilename :let @*=expand("%:p")
" Removes trailing whitespaces
command! RemoveTrailingWhitespaces :%s/\s*$//

" Vimrc editing
command! EditVimrc :tabedit $HOME/.vim/vimrc
command! ReloadVimrc :so $HOME/.vim/vimrc
" Git shortcuts
nmap <space>B :NewBranch 
command! -nargs=1 NewBranch :Git checkout -b <args>
command! GitPush :!git push origin HEAD
command! GitPushForce :!git push -f origin HEAD
" Close all buffers but one
command! CloseAllBuffers :%bd
command! CloseBuffersButOne :%bd|e#

" Create the directory containing the file in the buffer
command! Mkdir :!mkdir -p %:p:h


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on  " automatically detect file types

" In Makefiles, use real tabs, not tabs expanded to spaces
autocmd FileType make set noexpandtab

" Make sure all mardown files have the correct filetype set and setup wrapping
autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt,md.erb} setf markdown
autocmd BufNewFile,BufRead *.md.erb set ft=markdown

" Treat JSON files like JavaScript
" autocmd BufNewFile,BufRead *.json set ft=javascript

autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4
autocmd FileType php set softtabstop=4 tabstop=4 shiftwidth=4
autocmd FileType java set softtabstop=4 tabstop=4 shiftwidth=4
autocmd FileType sh set softtabstop=4 tabstop=4 shiftwidth=4

" Ruby
" key `<,r>` -- (ft=ruby) :TestFile
autocmd FileType ruby nmap <buffer> tn :w<CR>:TestNearest<CR>
autocmd FileType ruby nmap <buffer> tf :w<CR>:TestFile<CR>
autocmd FileType ruby nmap <buffer> ts :w<CR>:TestSuite<CR>
autocmd FileType ruby nmap <buffer> tf :w<CR>:TestFile<CR>
autocmd FileType ruby nmap <buffer> tl :w<CR>:TestLast<CR>
autocmd FileType ruby nmap <buffer> tv :w<CR>:TestVisit<CR>
autocmd BufNewFile,BufRead Dangerfile set ft=ruby

" Golang
autocmd FileType go set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType godoc set softtabstop=8 tabstop=8 shiftwidth=8 noexpandtab
" key `<,R>` -- (ft=go) !go run %
autocmd FileType go nmap <buffer> <leader>R :w<CR>:!go run %<TAB><CR>
autocmd FileType go set listchars=tab:\ \ ,trail:·,extends:❯,precedes:❮,nbsp:×

" Lua
autocmd FileType lua nnoremap <leader>r :ter ++kill=kill lua-spec %:p<CR>
autocmd FileType lua autocmd TerminalOpen * nnoremap <buffer> <c-c> :bw!<CR>
autocmd FileType lua command! GotoSpec :execute "e ".system("find-lua-spec ".expand("%"))
autocmd FileType lua command! GotoTest :execute "e ".system("find-lua-spec ".expand("%"))


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUBY CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Syntax Highlights
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd WinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Projectionist
let g:rails_projections = {
      \ "app/components/*_component.rb": {
      \   "related": "app/components/{}_component.html.erb"
      \ },
      \ "app/components/*_component.html.erb": {
      \   "related": "app/components/{}_component.rb"
      \ }}
let g:projectionist_heuristics = {
      \ "*.lua": {
      \   "src/*.lua": {
      \     "alternate": "spec/{}_spec.lua"
      \   },
      \   "spec/*_spec.lua": {
      \     "alternate": "src/{}.lua"
      \   }
      \ }}

""" COC
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:coc_snippet_next = '<tab>'
" let g:coc_snippet_prev = '<s-tab>'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

""""""""""""""""""""""""""""""
""" Clap
""""""""""""""""""""""""""""""
let g:clap_disable_run_rooter = v:true
let g:clap_layout = { 'relative': 'editor', 'width': '100%', 'height': '50%', 'row': 3, 'col': 0 }
let g:clap_preview_size = 7
let g:clap_preview_direction = 'UD'

nmap <space><space> :Clap<cr>
nmap <space>g :Clap grep2<cr>
nmap <space>f :Clap files --hidden<cr>
nnoremap <silent> <expr> <space>f (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Clap files --hidden\<cr>"
nmap <space>t :Clap tags<cr>
nmap <space>T :Clap proj_tags<cr>
nmap <space>j :Clap jumps<cr>
nmap <space>h :Clap help_tags<cr>
nmap <space>y :Clap yanks<cr>
nmap <space>b :Clap git_branch<cr>
nmap <space>d :Clap directories<CR>
nmap <space>D :Clap directories<CR>
map \ :Clap command<CR>

let g:clap_provider_git_branch = {
      \ 'source': 'git branch --format=''%(refname:short)'' --sort=-committerdate',
      \ 'sink': 'silent Git checkout',
      \ }

let g:clap_provider_directories = {
      \ 'source': 'find . -type d',
      \ 'sink': 'e',
      \ }

autocmd Syntax clap_files exec 'syntax match ClapIcon' '/^.*\s/' 'contained'
autocmd Syntax clap_files highlight! ClapIcon guifg=#788890
autocmd Syntax clap_files exec 'syntax match ClapFile' '/^.*/' 'contains=ClapIcon'
autocmd Syntax clap_files highlight! ClapFile guifg=#cccccc

""" Test
let test#strategy = "vimterminal"
" let test#strategy = "iterm"

""" Golang
let g:go_doc_keywordprg_enabled = 0

""" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

""" NerdCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""" FZF
set rtp+=/usr/local/opt/fzf

""" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

""" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <leader>/ :call incsearch#call(incsearch#config#fuzzy#make())<cr>

""" Fugitive
nmap <leader>gs :tab Git<CR><C-w>20+
nmap <leader>gp :!git push origin HEAD<CR>

""" Gundo
command! Gundo :GundoToggle

"""" Git
command! GdiffInTab tabedit %|Gdiff
" key `<,D>` -- Git diff in tab
nnoremap <leader>D :GdiffInTab<cr>
command! GitPull :Git pull

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

" Fix brackets paste in cmd lines
augroup DisablePasteInCommandLine
    autocmd!
    autocmd CmdlineEnter * :set nopaste
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fern
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Bs> :Fern . -drawer -toggle<CR>
nnoremap <leader><Bs> :Fern . -reveal=% -drawer<CR>
let g:fern#renderer = "nerdfont"
let g:fern#default_exclude = '^.DS_Store\|.coverage$'
function s:init_fern_mappings()
  nmap <buffer> <Bs> :Fern . -drawer -toggle<CR>
  nmap <buffer> z <Plug>(fern-action-zoom:half)
  nmap <buffer> o <Plug>(fern-action-open)
  nmap <buffer> i <Plug>(fern-action-open:below)
  nmap <buffer> - <Plug>(fern-action-mark)j
  nmap <buffer> <CR> <Plug>(fern-action-cd)<Plug>(fern-action-enter)
  nmap <buffer> u <Plug>(fern-action-leave)<Plug>(fern-action-cd:root)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-action-open)
  " nmap <buffer> R <Plug>(fern-action-reload:all)
endfunction
augroup fern
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fern call s:init_fern_mappings()
augroup END

let g:nerdfont#path#extension#customs = { 'tl': '' }
let g:glyph_palette#palette = copy(g:glyph_palette#defaults#palette)
let g:glyph_palette#palette['GlyphPalette6'] += ['']

" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-enter>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

