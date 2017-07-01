source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
set nocompatible "ȥ���й�viһ����ģʽ��������ǰ�汾��bug�;���
set nu "ʵ���к�
"����������� set guifont=ziti/ziming/zihao
filetype on "����ļ�����
set history=1000 "��¼��ʷ����
syntax on "�����﷨������ʾ
set autoindent "�����Զ����룬��ǰ�еĸ�ʽӦ�õ���һ��
set cindent "���ö�C�﷨�Զ�����
set smartindent "����Ϊ���ܶ���
set tabstop=4 "����tabΪ4���ո�
set shiftwidth=4 "���û��н���ʱʹ��4���ո�
set ai! "�����Զ�����
set showmatch "����Ϊƥ��ģʽ���Զ����ƥ�������
"set guioptions=T ȥ��GUI�еĹ�����
"set vb t_vb= ȥ���������ʱ�ľ���
set ruler "�༭ʱ���½���ʾ���λ�õ�״̬��
set nohls "�ر�����ƥ��ĸ�����ʾ
set incsearch "���ÿ���ƥ��
set backspace=2 "�����˸��Ϊ2���ո�
"���������ַ�����������
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

