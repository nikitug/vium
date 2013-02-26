"
" ## SnipMate
"
let g:snips_trigger_key='<C-space>'

"
" ## NERDTree
"

" key <Backspace> toggle NERDTree
nnoremap <Bs> :NERDTreeToggle<CR>
" key <,nf> :NERDTreeFind find current file in NERDTree
nnoremap <S-Bs> :NERDTree 
" key <,nf> :NERDTreeFind find current file in NERDTree
nnoremap <leader>nf :NERDTreeFind<CR>

" exit nerdtree if it's the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o', '\~$']
let NERDTreeHijackNetrw = 0
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

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
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
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


"
" ## Ack
"
" key <,f> :Ack
map <leader>f :Ack<space>


"
" ## ZoomWin
"
" key <,zw> Toggle ZoomWin
map <leader>zw :ZoomWin<CR>


"
" ## Gundo
"
" key <,gu> Toggle Gundo
map <leader>gu :GundoToggle<CR>


"
" ## Kwbd
"
" key <C-W>! delete buffer without closing window
map <C-W>! <Plug>Kwbd


"
" ## Syntastic
"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_warnings=0


"
" ## TagBar
"
" key <,tb> toggle tagbar
map <leader>tb :TagbarToggle<CR>


"
" ## CtrlP
"
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("t")': ['<c-t>'] }
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

