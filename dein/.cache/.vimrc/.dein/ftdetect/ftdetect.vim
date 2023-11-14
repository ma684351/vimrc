if !has('patch-7.4.480')
    " Before this patch, vim used modula2 for .md.
    au! filetypedetect BufRead,BufNewFile *.md
endif

" vint: -ProhibitAutocmdWithNoGroup
au BufRead,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown
au BufRead,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setfiletype markdown
function! s:DetectHelpFileType() abort
  " NOTE ':help' command sets "help" filetype automatically
  const ext = expand('<afile>')->fnamemodify(':e')
  if ext ==# 'md' || ext ==# 'mkd'
    autocmd BufWinEnter <buffer> ++once setfiletype markdown
  endif
endfunction

autocmd FileType help call s:DetectHelpFileType()
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
autocmd BufReadPost *.fugitiveblame setfiletype fugitiveblame
