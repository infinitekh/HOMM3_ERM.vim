"===============================================================================
"
"          File:  erm.vim
" 
"   Description:  Filetype detection for HOMM3 ERM script.
"
" 
"   VIM Version:  7.0+
"        Author:  ekh0324@gmail.com	
"  Organization:  
"       Version:  1.0
"       Created:  2020-04-28
"      Revision:  ---
"       License:  Copyright (c) 2020, KIM Hyeok
"===============================================================================

autocmd BufNewFile,BufRead *.erm setfiletype erm
"autocmd BufNewFile,BufRead *.erm execute 'setlocal dict+=erm_events.txt'
autocmd BufNewFile,BufRead *.erm execute 'setlocal dict+=' . expand("<sfile>:p:h") . "/erm_events.txt"


