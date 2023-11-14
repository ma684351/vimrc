if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/anzai/.vim/dein/repos/github.com/Shougo/dein.vim,/home/anzai/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim90,/usr/share/vim/vimfiles/after,/home/anzai/.vim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/anzai/.vimrc', '/home/anzai/.vim/.dein.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/anzai/.vim/dein'
let g:dein#_runtime_path = '/home/anzai/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/anzai/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/anzai/.vim/dein/repos/github.com/Shougo/dein.vim,/home/anzai/.vim,/usr/share/vim/vimfiles,/home/anzai/.vim/dein/repos/github.com/Shougo/vimproc.vim,/home/anzai/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim90,/home/anzai/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/anzai/.vim/after'
filetype off
