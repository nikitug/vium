" Adds shortcut `t` to open directory in new terminal

if exists("g:loaded_nerdtree_terminal_menuitem")
  finish
endif
let g:loaded_nerdtree_terminal_menuitem = 1

call NERDTreeAddMenuItem({
      \ 'text': 'open in (t)erminal',
      \ 'shortcut': 't',
      \ 'callback': 'NERDTreeTerminal' })
function! NERDTreeTerminal()
  let dir = g:NERDTreeDirNode.GetSelected().path.str()
  silent exec "!tmux new-window -c ".dir
endfunction
