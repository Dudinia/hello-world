"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""     Vandle     """""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$VIMHOME/vimfiles/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'pangloss/vim-javascript'
Plugin 'delimitMate.vim'
Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
let g:javascript_plugin_flow = 1

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available



 
"мерцание вместо бибиканья
set visualbell


" Список используемых кодировок для автоматического их определения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" установить keymap, чтобы по Ctrl+^ переключался на русский и обратно
set keymap=russian-jcukenwin 
" по умолчанию - латинская раскладка
set iminsert=0

" Поддержка русской раскладки
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255

":language ctype Russian_Russia.1251

" Включаем нумерацию строк
set nu

" Включить автоотступы
"set autoindent

" Влючить подстветку синтаксиса
"syntax on

"Пробелы вместо табов
set expandtab
" Размер отступов
set shiftwidth=4
" Размеры табуляций
set tabstop=4
set softtabstop=4
" Более "умные" отступы при вставке их с помощью tab. 
" На самом деле заметить влияние этой опции тяжело, но хуже из-за нее не будет :)
"set smarttab

" размеры окна
set lines=49
set columns=90

" всегда делать активное окно максимального размера
" set noequalalways
" set winheight=9999

" Автоматическое закрытие скобок
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap { {}<LEFT>

" Цветовая схема
color desert

" Шрифт
"set guifont=Deja\ Vu\ Sans\ Mono\ 17
set guifont=courier_new:h12:cRUSSIAN

" отображение выполняемой команды
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline

" Помогает заработать букве "ю"
au BufEnter *.tex set keymap=russian-jcukenwin


"Проверка орфографии
"setlocal spell spelllang=ru_ru,en_us 
"set wildmenu
"set wcm=<Tab>
"menu Spl.next >s
""menu Spl.prev
"menu Spl.word_good zg
"menu Spl.word_wrong zw
"menu Spl.word_ignore zG
"
"imap <F2> <Esc>:set spell!<CR>
"nmap <F2> :set spell!<CR>
"imap <C-F2> <Esc>:emenu Spl.<TAB>
"nmap <C-F2> :emenu Spl.<TAB>

"Encoding

set wildmenu
set wcm=<Tab>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>  
menu Encoding.koi8-u :e ++enc=koi8-u<CR> 



