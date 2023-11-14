scriptencoding utf-8

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"インクリメンタルサーチを行う
set incsearch
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"---------------------------------------------------------------------------
" 編集に関する設定:
"
"vi互換をオフする
set nocompatible
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開する (noexpandtab:展開しない)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
"自動インデントの幅
set shiftwidth=4
"新しい行を作った時に高度な自動インデントを行う
set smarttab
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"クリップボードをWindowsと連携する
set clipboard=unnamed
"Vimの内部文字コード
set encoding=utf-8
"ファイル読み込み時の文字コード
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
"改行コード
set fileformats=unix,dos,mac

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
"ファイルを開いたときにカレントディレクトリに移動する
"set autochdir
"
"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
"set nobackup
"no create undofile
"set noundofile
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.vimbackup
"スワップファイル用のディレクトリを指定する
set directory=$HOME/.vimbackup

"---------------------------------------------------------------------------
"mappings
"
"括弧の補完
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap " ""<Left>
inoremap ' ''<Left>
"Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
"検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"---------------------------------------------------------------------------
"plugin
"
"dein
if &compatible
    set nocompatible
endif

"dein.vimのディレクトリ
let s:dein_dir = expand('$HOME/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"なければgit clone
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" 管理するプラグインを記述したファイル
let s:toml = '$HOME/.vim/.dein.toml'
"延滞読み込みさせる場合はこちらにプラグインを記述する
"let s:lazy_toml = '$HOME/.vim/.dein_lazy.toml'

" 読み込み、キャッシュは :call dein#clear_cache() で消せます
if dein#load_state(s:dein_dir)
    "bigin dein
    call dein#begin(s:dein_dir)
    ".dein.tomlを読み込む
    call dein#load_toml(s:toml, {'lazy': 0})
    ".dein_lazy.tomlを読み込む
    "call dein#load_toml(s:lazy_toml, {'lazy': 1})
    
    "end dein
    call dein#end()
    call dein#save_state()
endif

"インストールしていないものはこちらに入れる
if dein#check_install()
    call dein#install()
endif
"プラグインの設定を読み込む
if filereadable(expand('$HOME/.vim/plugins_rc.vim'))
    source $HOME/.vim/plugins_rc.vim
endif

filetype plugin indent on

"---------------------------------------------------------------------------

