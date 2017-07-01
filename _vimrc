source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
set nocompatible "去掉有关vi一致性模式，避免以前版本的bug和局限
set nu "实现行号
"设置字体可用 set guifont=ziti/ziming/zihao
filetype on "检测文件类型
set history=1000 "记录历史行数
syntax on "设置语法高亮提示
set autoindent "设置自动对齐，当前行的格式应用到下一行
set cindent "设置对C语法自动缩进
set smartindent "设置为智能对齐
set tabstop=4 "设置tab为4个空格
set shiftwidth=4 "设置换行交错时使用4个空格
set ai! "设置自动缩进
set showmatch "设置为匹配模式，自动添加匹配的括号
"set guioptions=T 去除GUI中的工具栏
"set vb t_vb= 去除命令错误时的警报
set ruler "编辑时右下角显示光标位置的状态栏
set nohls "关闭搜索匹配的高亮显示
set incsearch "设置快速匹配
set backspace=2 "设置退格键为2个空格
"设置中文字符的乱码问题
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=prc
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

