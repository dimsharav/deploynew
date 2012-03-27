set nocompatible                " несовместим с vi

set nobackup                      " сохранять бэкапы
set history=50                  " keep 50 lines of command line history
set ruler	                    
set noshowcmd	            	" display incomplete commands
set incsearch	            	" do incremental searching

set foldmethod=indent           " установить свертку (za - раскрыть/свернуть)
set foldlevel=99

" Разрешаем pathogen TODO: нормальное описание
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on                       " подсветка синтаксиса
set hlsearch                    " подсветка найденных значений
filetype on                     " попробовать определить тип файла
filetype plugin indent on       " загрузка файла отступов для типа файла TODO: нормальное описание
"autocmd FileType text setlocal textwidth=78

let mapleader = ","             " установка <leader> в ","

" Set format of statusline
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

" Кодировка терминала, должна совпадать с той, которая используется для вывода в терминал
set termencoding=utf-8
" Возможные кодировки файлов и последовательность определения
set fileencodings=utf8,cp1251
set encoding=utf8

"set nu                          " нумерация строк

set expandtab                   " пробелы вместо табуляции
set tabstop=4                   " размер табуляции - 4
set shiftwidth=4                " ширина отступа - 4 пробела

"-----------------
" Russian support
"-----------------

set keymap=russian-jcukenwin    " включение русской раскладки
set iminsert=0                  " по умолчанию - латинская раскладка 
set imsearch=0                  " по умолчанию - латинская раскладка при поиске 
set spelllang=en_us,ru_yo       " cловарь для проверки с Ё

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
" End of the russian support
""""""""""""""""""

"---------
" Mapping 
"---------

map <leader>td <Plug>TaskList       " \td включает плагин TaskList
map <leader>n :NERDTreeToggle<CR>   " \n открывает NERDTree

" Hint: разделение окна
" Vertical Split: Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q

" Ctrl+jklh - перемещение между окнами
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" F2 - быстрое сохранение
nmap <F2> :w<cr>                " нормальный режим
vmap <F2> <esc>:w<cr>li         " визуальый режим
imap <F2> <esc>:w<cr>li         " режим вставки

" Просмотр шелла
"map <F5> :execute '!'<CR>

""" Python
" Проверка PEP8
let g:pep8_map='<leader>8'

" django TODO: нормальное описание
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Автодополнение
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Выполнение программ python по F9
nmap <F9> :w<cr>:execute '!python2 %'<CR>
vmap <F9> <esc>:w<cr>:execute '!python2 %'<CR>
imap <F9> <esc>:w<cr>:execute '!python2 %'<CR>

autocmd! bufwritepost ~/.vimrc execute "normal! :source ~/.vimrc"

colorscheme wombat256mod
set t_Co=256        " 256 цветов
