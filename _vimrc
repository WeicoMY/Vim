"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"Use Vim setting,rather than Vi setting
set nocompatible

"Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"set syntax
syntax on
syntax enable

"no backup
set nobackup
set noswapfile
set nowritebackup

"Change the tab into spaces
set expandtab
set tabstop=4 "Set the length of the tab
set shiftwidth=4 "Set the count of the automatic indent
set shiftround

"Backspace like most programs in inset mode
set backspace=2

"automatically intend
set ai!

"Set the encoding
set fencs=utf-8,gbk,gbk18030,gb2312,cp036
set fenc=utf-8

"Share the clipboard with system
set clipboard+=unnamed

"-------------GUI--------------
"Set the theme"
colorscheme desert

"Set the font type and the font size
set guifont=consolas:h16

"set the cursor position all the time
set ruler

"set line number
set nu!

"No toolbar
set guioptions-=T

"No menubar
"set guioptions-=m

"remove the sroll bar on the left and right
set guioptions-=r
set guioptions-=L

"Set the size of the windows
set lines=35
set columns=100
"------------------------------
 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

