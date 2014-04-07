"
" Filename : gitu.vim
" Brief    : This file is vim plugin
" Function : filer for git commit
" Author   : pebble8888@gmail.com 2014 Copyright
" History  :
"   Ver1.0.0  2014-03-29 initial revision 
"   Ver1.1.0  2014-04-07 bug fix
"
" Implementation below

function! Gitu()
  let s:basedir = system('git rev-parse --show-toplevel') 
  let s:cmd = 'lcd ' . s:basedir
  execute s:cmd
  let filelist = system('git diff --name-only')  
  let save_errorformat = &errorformat
  let &errorformat = '%f'
  lexpr filelist 
  let &errorformat = save_errorformat
  lopen
endfunction

command! Gitu call Gitu()

