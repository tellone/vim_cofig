"""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""
"{{{
set nocp

"To diable pathogen bundels put the name of
"the basefolder down below
" let g:pathogen_disabled=['basefolder']

"Load pathogen itself
runtime bundle/vim-pathogen/autoload/pathogen.vim

"run plugins in bundle folder
call pathogen#infect()
call pathogen#helptags()
"}}}

"""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""
"{{{

" Sets how many lines of history VIM has to remember
set history=700


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
set magic "Set magic on, for regular expressions
set complete-=i     " Searching includes can be slow
set display=lastline

"}}}

"""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""
"{{{

"=> search settings and macros
set ignorecase "Ignore case when searching
set smartcase  "Override Ingnore case in obvious situations

set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers

set showmatch "Show matching bracets when text indicator is over them

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

"}}}

"""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""
"{{{

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


"}}}

"""""""""""""""""""""""""""""""
" => Colors, Fonts and Display
"""""""""""""""""""""""""""""""
"{{{

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
  colorscheme mycasts
endif

try
  lang en_US
catch
endtry



" standard 
""""""""""""""""""""""""""""""""
" => Moving and swiching 
""""""""""""""""""""""""""""""""
"{{{
"kill search hl
nmap <silent> <leader><cr> :noh<cr>

"big Q formats text and no Ex-mode
nmap Q ==

" When pressing <leader>cd switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>

"}}}

""""""""""""""""""""""""""""""""
" => Plugin Settings
""""""""""""""""""""""""""""""""
"{{{

" => Ack
let g:ackprg="ack -H --nocolor --nogroup --column"



" => NerdTree
nmap <leader>n :NERDTree<cr>
let NERDTreeShowHidden=1
let NERDTreeBookmarksFile =  '/home/tellone/.vim/misc/.NERDTreeBookmarks'

"}}}

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
  
  autocmd BufEnter *NERD_tree*,__Tagbar__, __Gundo__
        \ nnoremap <silent> <buffer> <up> k |
        \ nnoremap <silent> <buffer> <down> j

 
  
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
  autocmd FileType text,txt setlocal tw=78 linebreak nolist spell
  autocmd FileType help,text,txt colorscheme lucius
  autocmd FileType markdown setlocal spell linebreak nolist
  autocmd FileType markdown colorscheme jdlight
  autocmd FileType vbnet    runtime! indent/vb.vim
  autocmd FileType vim  setlocal ai et sta sw=2 sts=2 keywordprg=:help
augroup END "}}}2

"{{{2 " => Ruby and rails section

augroup RubySetter
  au!
  au FileType ruby setlocal ai et sta sw=2 sts=2
  au FileType ruby setlocal tw=79 isfname+=: comments=:#\
  au FileType ruby iabbr <buffer> bpry binding.pry
  au FileType ruby
        \ if expand('%') =~# '_test\.rb$' |
        \ compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
        \ elseif expand('%') =~# '_spec\.rb$' |
        \ compiler rspec | setl makeprg=rspec\ \"%:p\" |
        \ else |
        \ compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
        \ endif
augroup END



"Rails settings

"}}}2

"{{{2 " => Python section
augroup PYset
  au!
  au FileType python syn keyword pythonDecorator self
  au FileType python setlocal linebreak nolist
  au FileType python setlocal ai et sta tw=79 sw=4 sts=4
  au bufWrite *.py  silent! call DeleteTrialingWS()  
augroup END

"}}}2

"{{{2 => JavaScript section
 
augroup JSset
  au!
  au FileType javascript call JavaScriptFold()
  au FileType javascript setl fen nocin ai et sta sw=2 sts=2 ts=2 isk+=$
  au FileType javascript imap <c-t> AJS.log();<esc>hi
  au FileType javascript imap <c-a> alert();<esc>hi
  au FileType javascript let b:surround_101 = "\r\n}"
  au FileType javascript inoremap <buffer> $r return
  au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
augroup END
"}}}2

"{{{2 => Java section
 
augroup JavaSet
  au!
  au FileType java setl fen si ai et si sta sw=3 sts=3 ts=3 isk+=$
  au FileType java let b:surround_101 = "\r\n}"
  au FileType java inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
  au FileType java iabbr <buffer> pri private
  au FileType java iabbr <buffer> pu public
  au FileType java iabbr <buffer> sys. System.out.println(" ");
augroup END
"}}}2
"}}}

"""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""
"{{{
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
nmap <leader>qq :e ~/buffer<cr>
nnoremap <leader>bb :OpenURL <cfile><CR>

nnoremap <leader>" viw<esc>a;<esc>lel

" => General Abbrevs "{{{2
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab @@f filip.diloom@gmail.com
"}}}2

"}}} 
