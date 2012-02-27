set nocompatible

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler	        " show the cursor position all the time
set noshowcmd		" display incomplete commands
set incsearch		" do incremental searching

syntax on
set hlsearch
filetype on
filetype plugin on
filetype plugin indent on
autocmd FileType text setlocal textwidth=78

" ==============================================================================
" My changes
" ==============================================================================
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

" Выполнение программ python по F9
nmap <F9> :w<cr>:execute '!python2 %'<CR>
vmap <F9> <esc>:w<cr>:execute '!python2 %'<CR>
imap <F9> <esc>:w<cr>:execute '!python2 %'<CR>

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
" 256 цветов
set t_Co=256
