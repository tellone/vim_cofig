let b:atp_TexCompiler="pdflatex"			
let b:atp_Viewer="evince"			
let g:lucius_style="light"
Globalscheme faded-white

:Bigger
let g:atp_folding=1
let g:atp_statusline=0
let g:atp_tab_map=1
let b:atp_updatetime_insert = 90000
let b:atp_updatetime_normal = 30000
if exists("&breakindent")
  set breakindent showbreak=""
endif
call Pl#Load()
nmap <buffer> <M-j> <Plug>TexSyntaxMotionForward
nmap <buffer> <M-k> <Plug>TexSyntaxMotionBackward
if has("gui_running")
  set showbreak=\ \ \ +
endif
set spell
