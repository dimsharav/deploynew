" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>


" allow backspacing over everything in insert mode
"set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set noshowcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype on
filetype plugin on
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" ==============================================================================
" My changes
" ==============================================================================
" Show hints for commands (?)
set wildmenu 
set laststatus=2
" Set format of statusline
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>li
imap <F2> <esc>:w<cr>i

" Russian language keyboard mappings (UTF-8) / From the-bosha.ru
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б < map Ю >
" End of the mapping

" Кодировка терминала, должна совпадать с той, которая используется для вывода в терминал
set termencoding=utf-8
" Возможные кодировки файлов и последовательность определения
set fileencodings=utf8,cp1251
" (?)
set encoding=utf8

" Нумерация строк
set nu

" Вместо табов - по 4 пробела
set et!
set ts=4

" Компиляция и выполнение паскаль-программ по F9
" -Sd включает режим компиляции, совместимый с Delphi 7
" let ckeys=' -Sd'
"map <F9> :execute '!fpc %'<CR>
"map <C-F9> :execute '!fpc %'<CR><CR>:execute '!./%:r'<CR><CR>
nmap <F9> :w<cr>:execute '!python2 %'<CR>
vmap <F9> <esc>:w<cr>:execute '!python2 %'<CR>
imap <F9> <esc>:w<cr>:execute '!python2 %'<CR>
map <C-F9> :execute '!fpc %'<CR><CR>:execute '!./%:r'<CR><CR>

" Просмотр шелла
map <F5> :execute '!'<CR>

" Словарь для проверки с Ё
set spelllang=ru_yo,en_us

" Russian support
set keymap=russian-jcukenwin 
" по умолчанию - латинская раскладка 
set iminsert=0 
" по умолчанию - латинская раскладка при поиске 
set imsearch=0

autocmd! bufwritepost ~/.vimrc execute "normal! :source ~/.vimrc"

colorscheme wombat
let python_highlight_all = 1
set t_Co=256
