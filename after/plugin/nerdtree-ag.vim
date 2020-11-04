" Adds shortcut `g` to search in directory

if exists("g:loaded_nerdtree_grep_menuitem")
  finish
endif
let g:loaded_nerdtree_grep_menuitem = 1

call NERDTreeAddMenuItem({
      \ 'text': '(g)rep in dir',
      \ 'shortcut': 'g',
      \ 'callback': 'NERDTreeGrep' })
function! NERDTreeGrep()
  let dir = g:NERDTreeDirNode.GetSelected().path.str()
  let search = input("Options and search pattern: ")
  if search == ''
    return
  endif
  if expand('%') =~ 'NERD_tree'
    wincmd w
  endif
  silent exec "Ack '".escape(search, "'")."' '".escape(dir, "'")."'"
endfunction

" Adds shortcut `s` to search in directory using clipboard content

call NERDTreeAddMenuItem({
      \ 'text': 'grep in dir using (s)tring from cipboard',
      \ 'shortcut': 's',
      \ 'callback': 'NERDTreeGrepClipboard' })
function! NERDTreeGrepClipboard()
  let dir = g:NERDTreeDirNode.GetSelected().path.str()
  if expand('%') =~ 'NERD_tree'
    wincmd w
  endif
  silent exec "Ack '".escape(@", "'")."' '".escape(dir, "'")."'"
endfunction
