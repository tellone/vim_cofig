"""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""
"{{{
set nocp
syntax enable
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin indent on

"to avoid confusion tell vim which shell you use
set shell=/bin/zsh
" Set to auto read when a file is changed from the outside
set autoread

"fixes for unix
set winaltkeys=no
set backspace=eol,start,indent

" With a map leader is the shortcut for global plugins
let mapleader = ","
let g:mapleader = ","

"Like mapleader but should be used for filetype spefic plugins
let maplocalleader = ";"
let g:maplocalleader = ";"



"Backup and swapfiles
set nobackup
set nowb
set noswapfile

set undodir=/home/tellone/.vim/undodir
set undofile
set hid "Change buffer - without saving

"no backup on these filenames
set backupskip+=*.tmp,crontab.*

"Sets hub for external eval
if has("balloon_eval") && has("unix")
  set ballooneval
endif

set magic "Set magic on, for regular expressions
set complete-=i     " Searching includes can be slow
set display=lastline

"}}}

"""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""
"{{{
" Set 7 lines to the curors - when moving vertical..
set so=7

set cmdheight=1 "The commandbar height
set laststatus=0 "comandbar visable at start

"=> settings for linebreak and linewrapping
set foldmethod=marker
set lbr
set tw=500
set wrap "Wrap lines
set whichwrap+=<,>,h,l

"Set linebreak visable with +++
if exists("&breakindent")
  set breakindent showbreak=+++
elseif has("gui_running")
  set showbreak=+
endif

"=> search settings and macros
set ignorecase "Ignore case when searching
set smartcase  "Override Ingnore case in obvious situations

set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers

set showmatch "Show matching bracets when text indicator is over them
set lazyredraw "Don't redraw while executing macros 

set mat=3 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"wildcards and wildmenu
set wildmenu "Turn on WiLd menu
set wildmode=longest:full,full
set wildignore+=*~,*.aux,tags "don't show swap, aux or tags in wildmenu

set suffixes+=.dvi " Lower priority in wildcards
set tags+=../tags,../../tags,../../../tags,../../../../tags


"spelling
set dictionary+=/usr/share/dict/words
set spelllang=en,sv
set nospell

"}}}

"""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""
"{{{
"Set font when startimg gvim
function! s:initialize_font()
    if exists("&guifont")
        if has("mac")
            set guifont=Monaco:h12
        elseif has("unix")
            if &guifont == ""
                set guifont=bitstream\ vera\ sans\ mono\ 14
            endif
        elseif has("win32")
            set guifont=Consolas:h11,Courier\ New:h10
        endif
    endif
endfunction

"Opens the url under the cursor
function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !firefox \"".a:url."\""
  else
    exe "silent !firefox -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"smarter way to close current buffer
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
"}}}

"""""""""""""""""""""""""""""""
" => Colors, Fonts and Display
"""""""""""""""""""""""""""""""
"{{{
augroup Guiset
  au!
  au GUIEnter *  call s:initialize_font()
augroup END

command! -bar -nargs=0 Bigger :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')

if has("gui_running")
  set guioptions-=T
  set guioptions+=m "enables menubar
  set t_Co=256
  set background=dark
  
  set encoding=utf8
  map <M-n> :Bigger<cr>
  map <M-m> :Smaller<cr>
elseif $DISPLAY == '' || !has("gui")
  set mouse=
endif

if $TERM =~ '^screen'
  if exists("+ttymouse") && &ttymouse == ''
    set ttymouse=xterm
  endif
  if $TERM != 'screen.linux' && &t_Co == 8
    set t_Co=16
  endif
endif

if $TERM == 'xterm-color' && &t_Co == 8
  set t_Co=16
else
  set t_Co=256
  set encoding=utf8
endif

try
  lang en_US
catch
endtry


set ffs=unix,dos

" standard options for different colors
let g:lucius_style="light"

colorscheme lucius
"}}}

"""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""
"{{{
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e /

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"Fix anoying save and quit misses
cmap Wq wq
cmap WQ wq

" Useful on some European keyboards
nmap ½ $
imap ½ $
vmap ½ $
cmap ½ $

"}}}

""""""""""""""""""""""""""""""""
" => Moving and swiching 
""""""""""""""""""""""""""""""""
"{{{
"kill search hl
nmap <silent> <leader><cr> :noh<cr>

"big Q formats text and no Ex-mode
nmap Q gwip

" Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Close the current buffer
nmap <leader>bd :Bclose<cr>

" Close all the buffers
nmap <leader>ba :1,300 bd!<cr>


" make space open fods
nmap <space> 3j

"=> Foldchange
nmap <leader>zz :call FoldChange()<cr>

" When pressing <leader>cd switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()

nmap <leader>pp :setlocal paste!<cr>
" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry
"}}}

""""""""""""""""""""""""""""""""
" => Plugin Settings
""""""""""""""""""""""""""""""""



" => NerdTree
nmap <leader>n :NERDTree<cr>
let NERDTreeShowHidden=1
let NERDTreeBookmarksFile =  '/home/tellone/.vim/misc/.NERDTreeBookmarks'

" => Twitvim
" let twitvim_token_file = '/home/tellone/.vim/misc/cens/twitvim.token'
" let twitvim_browser_cmd = 'firefox'" 
" source /home/tellone/.vim/misc/cens/twitinfo.vim



""""""""""""""""""""""""""""""""
" => Filtype settings
""""""""""""""""""""""""""""""""
"{{{
augroup FTMisc " {{{2
  autocmd!

  autocmd BufNewFile */init.d/*
    \ if filereadable("/etc/init.d/skeleton") |
    \   0r /etc/init.d/skeleton |
    \   $delete |
    \   silent! execute "%s/\\$\\(Id\\):[^$]*\\$/$\\1$/eg" |
    \ endif |
    \ set ft=sh | 1

  autocmd BufNewFile */.netrc,*/.fetchmailrc,*/.my.cnf let b:chmod_new="go-rwx"
    " autocmd BufNewFile  * let b:chmod_exe=1
    "autocmd BufWritePre * if exists("b:chmod_exe") |
       " \ unlet b:chmod_exe |
        "\ if getline(1) =~ '^#!' | let b:chmod_new="+x" | endif |
        "\ endif
    "autocmd BufWritePost,FileWritePost * if exists("b:chmod_new")|
        "\ silent! execute "!chmod ".b:chmod_new." <afile>"|
        "\ unlet b:chmod_new|
        "\ endif
  autocmd BufWritePre,FileWritePre /etc/* if &ft == "dns" |
      \ exe "normal msHmt" |
      \ exe "gl/^\\s*\\d\\+\\s*;\\s*Serial$/normal ^\<C-A>" |
      \ exe "normal g`tztg`s" |
      \ endif

  autocmd FileReadCmd *.doc,*.docx execute "read! antiword \"<afile>\""
  autocmd BufReadPre *.pdf setlocal binary
  autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
    \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
augroup END " }}}2

augroup FTCheck " {{{2
  autocmd!
  autocmd BufNewFile,BufRead */apache2/[ms]*-*/* set ft=apache
  autocmd BufNewFile,BufRead *named.conf*       set ft=named
  autocmd BufNewFile,BufRead *.cl[so],*.bbl     set ft=tex
  autocmd BufNewFile,BufRead /var/www/*.module  set ft=php

  autocmd BufNewFile,BufRead *.vb               set ft=vbnet
  autocmd BufNewFile,BufRead *.zsh-theme        set ft=zsh
  autocmd BufNewFile,BufRead *.CBL,*.COB,*.LIB  set ft=cobol
  autocmd BufNewFile,BufRead *_doc_*            setl ft=help
  autocmd BufNewFile,BufRead /var/www/*
    \ let b:url=expand("<afile>:s?^/var/www/?http://localhost/?")
  autocmd BufNewFile,BufRead /etc/udev/*.rules set ft=udev
  autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
    \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif
  autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif  
  autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
  autocmd BufNewFile,BufRead *.mako set ft=mako
  autocmd bufNewFile,BufRead *.m    set ft=matlab  
     
augroup END " }}}2

augroup FTOptions " {{{2
  autocmd!
  autocmd FileType c,cpp,cs               setlocal ai et sta sw=4 sts=4 si
  autocmd FileType sh,csh,tcsh,zsh        setlocal ai et sta sw=4 sts=4
  autocmd FileType tcl,perl,matlab        setlocal ai et sta sw=4 sts=4
  autocmd FileType markdown,liquid        setlocal ai et sta sw=2 sts=2 tw=72
  autocmd FileType php,aspperl,aspvbs,vb  setlocal ai et sta sw=4 sts=4
  autocmd FileType apache,sql,vbnet       setlocal ai et sta sw=4 sts=4
  autocmd FileType css,scss               setlocal ai et sta sw=2 sts=2
  autocmd FileType html,xhtml,wml,cf      setlocal ai et sta sw=2 sts=2
  autocmd FileType xml,xsd,xslt           setlocal ai et sta sw=2 sts=2 ts=2
  autocmd FileType yaml                   setlocal ai et sta sw=2 sts=2
  autocmd FileType cucumber               setlocal ai et sta sw=2 sts=2 ts=2
  autocmd FileType text,txt,mail          setlocal ai com=fb:*,fb:-,n:>
  autocmd FileType c,cpp,cs,perl,php,aspperl,css let b:surround_101 = "\r\n}"
  autocmd FileType apache       setlocal commentstring=#\ %s
  autocmd FileType aspvbs,vbnet setlocal comments=sr:'\ -,mb:'\ \ ,el:'\ \ ,:',b:rem formatoptions=crq
  autocmd FileType asp*         runtime! indent/html.vim
  autocmd FileType bst  setlocal ai sta sw=2 sts=2
  autocmd FileType cobol setlocal ai et sta sw=4 sts=4 tw=72 makeprg=cobc\ -x\ -Wall\ %
  autocmd FileType css  silent! setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>
  autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
  autocmd FileType help nnoremap <silent><buffer> q :q<CR>
  autocmd FileType html setlocal iskeyword+=~
  autocmd FileType pdf  setlocal foldmethod=syntax foldlevel=1
  autocmd FileType text,txt setlocal tw=78 linebreak nolist nospell
  autocmd FileType help,text,txt colorscheme lucius
  autocmd FileType markdown setlocal spell linebreak nolist
  autocmd FileType markdown colorscheme jdlight
  autocmd FileType vbnet    runtime! indent/vb.vim
  autocmd FileType vim  setlocal ai et sta sw=2 sts=2 keywordprg=:help
augroup END "}}}2

"}}}

"""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""
"{{{
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
nmap <leader>qq :e ~/buffer<cr>
nnoremap <leader>bb :OpenURL <cfile><CR>

nnoremap <leader>" viw<esc>a;<esc>lel

" => General Abbrevs "{{{2
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab @@f filip.diloom@gmail.com
"}}}2

:Bigger
:Bigger
"}}} 
