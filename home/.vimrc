set nocompatible                " несовместим с vi

" Отключить создание файлов бекапа и свопа
set nobackup
set nowritebackup
set noswapfile 

set history=50                  " keep 50 lines of command line history

"set cursorline                 " Выделять строку, на которой стоит курсор
                                "(иногда тормозит, очень, например, в конфиге вима)

set ruler	                    " описание TODO
set noshowcmd	            	" display incomplete commands
set incsearch	            	" do incremental searching

" Использовать фолдинг (свертку) (za - раскрыть/свернуть)
set foldenable
set foldmethod=indent
set foldlevel=99

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" pathogen - пакетный менеджер 
filetype off                    " не определять тип файла (для корректной работы pathogen)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on       " определять тип файла и отсутпы 
syntax on                       " подсветка синтаксиса (иногда тормозит)
set hlsearch                    " подсветка найденных значений
set ic!                         " регистронезависимый поиск
"autocmd FileType text setlocal textwidth=78

" Установка формата строки статуса TODO
"set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]
set statusline='status'

" размеры окна
"set lines=100
"set columns=150 

set nu                          " нумерация строк

set expandtab                   " пробелы вместо табуляции
set tabstop=4                   " размер табуляции - 4
set shiftwidth=4                " ширина отступа - 4 пробела

" Описание TODO 
"autocmd! bufwritepost ~/.vimrc execute "normal! :source ~/.vimrc"

colorscheme wombat256mod
set t_Co=256        " 256 цветов

"--------------
" Настройки GUI
"--------------
" Шрифт для gvim
set guifont=Monaco,10
" Убрать меню
set guioptions-=m
" Убрать тулбар
set guioptions-=T

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
map Б <
map Ю >

" Кодировка терминала, должна совпадать с той, которая используется для вывода в терминал
set termencoding=utf8
" Возможные кодировки файлов и последовательность определения
set fileencodings=utf8,cp1251
set encoding=utf8

" По F8 - меню выбора кодировки файла
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

"---------
" Mapping 
"---------
let mapleader = ","             " установка <leader> в ","

map <leader>td <Plug>TaskList       " ,td включает плагин TaskList
map <leader>n :NERDTreeToggle<CR>   " ,n открывает NERDTree
map <leader>h :tabp<CR>   " ,h открывает предыдущий буфер
map <leader>l :tabn<CR>               " ,h открывает следующий буфер

cnoreabbrev t tabnew

" Hint: разделение окна
"
" Vertical Split: Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current window: Ctrl+w + q

" Автоматическое закрытие скобок
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap { {}<LEFT>

" Ctrl+jklh - перемещение между окнами
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>li
imap <F2> <esc>:w<cr>li

" Автозакрытие тегов html
let g:closetag_html_style=1 

"--------
" Python
"--------

set autochdir                       "Автоматическое переключение рабочей папки

" Проверка PEP8
let g:pep8_map='<leader>8'

" django TODO: нормальное описание
map <leader>dt :set makeprg=python2\ manage.py\ test\|:call MakeGreen()<CR>

" Автодополнение
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Выполнение программ python по F9
nmap <F9> :w<cr>:execute '!python %'<CR>
vmap <F9> <esc>:w<cr>:execute '!python %'<CR>
imap <F9> <esc>:w<cr>:execute '!python %'<CR>
