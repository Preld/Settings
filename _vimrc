" http://blog.livedoor.jp/kumonopanya/archives/51048805.html
set nocompatible               " be iMproved

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

" NerdTreeの設定
" http://blog.livedoor.jp/kumonopanya/archives/51048805.html
NeoBundle 'scrooloose/nerdtree' "ディレクトリツリー表示
	nmap <silent> <C-e>      :NERDTreeToggle<CR>
	vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	omap <silent> <C-e>      :NERDTreeToggle<CR>
	imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
	autocmd vimenter * if argc() | NERDTree | endif "引数なしでvimを開いたらNERDTreeを起動する設定
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる設定
	let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$'] "NERDTreeIgnore 無視するファイルを設定
	let g:NERDTreeShowHidden=1 "NERDTreeShowHidden 隠しファイルを表示する設定
	let g:NERDTreeMinimalUI=1 "ブックマークや、ヘルプのショートカットをメニューに表示する設定
	let g:NERDTreeDirArrows=0 "NERDTreeを+|`などを使ってツリー表示をする設定
	"let g:NERDTreeMouseMode=2 "マウス操作方法の設定

" Web Coding 用 plugin
" http://qiita.com/alpaca_taichou/items/056a4c42fe7a928973e6
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle 'kchmck/vim-coffee-script'

" コメント関連
NeoBundle 'tomtom/tcomment_vim'
"NeoBundle 'taichouchou2/surround.vim'

" Git用
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

filetype plugin indent on     " required!
filetype indent on
syntax on

"----------------------------------------
"キーバインド変更
"----------------------------------------
" 行が折り返されている時上下移動が論理行単位ではなく表示行単位で行われるようにする
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" コマンドラインモードで %% を入力すると現在編集中のファイルのフォルダのパスが展開されるようにする
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" ノーマルモードへの遷移
inoremap <C-f> <ESC>

" ノーマルモードでスペースを入れる
"nnoremap <Space> jzz
nnoremap <Space> i<Space><ESC>

" Ctrl+spaceで保存
"nnoremap <Nul> :w<CR>
" Ctrl+sで保存
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>

"検索後画面の中心に
nmap n nzz
nmap N Nzz

" ノーマルモードで改行挿入
nnoremap <CR> o<ESC>

" 引用符や括弧をセットで入力したときにLeftする
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

"----------------------------------------
" システム設定
"----------------------------------------
"mswin.vimを読み込む
"source $VIMRUN

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set writebackup
"バックアップ/スワップファイルを作成する/しない
set backup
set backupdir=~/vim/backup
set swapfile
set directory=~/vim/swap
"set noswapfile
"再読込、vim終了後も継続するアンドゥ(7.3)
if version >= 703
  "Persistent undoを有効化(7.3)
  "set undofile
  "アンドゥの保存場所(7.3)
  "set undodir=.
endif
"viminfoを作成しない
"set viminfo=
"クリップボードを共有
set clipboard+=unnamed
"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500
"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
"ヒストリの保存数
set history=50
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"コマンドライン補完するときに強化されたものを使う
set wildmenu
"カーソル行の強調表示
set cursorline
"マウスを有効にする
"if has('mouse')
"  set mouse=a
"endif

"----------------------------------------
" 検索
"----------------------------------------
"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal

"----------------------------------------
" 表示設定
"----------------------------------------
"スプラッシュ(起動時のメッセージ)を表示しない
"set shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
"マクロ実行中などの画面再描画を行わない
"set lazyredraw
"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash
"行番号表示
set number
"括弧の対応表示時間
set showmatch matchtime=1
"タブを設定
"set ts=4 sw=4 sts=4
"自動的にインデントする
set autoindent
"Cインデントの設定
set cinoptions+=:0
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"色テーマ設定
"gvimの色テーマは.gvimrcで指定する
"colorscheme mycolor"

"""""""""""""""""""""""""""""
"ステータスラインに文字コードやBOM、16進表示等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
" diffの設定
if has('win95') || has('win16') || has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    silent! let saved_sxq=&shellxquote
    silent! set shellxquote=
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    " let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    let cmd = '!""' . $VIM . '\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
    silent exe cmd
    silent! let &shellxquote = saved_sxq
  endfunction
endif
"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" ノーマルモード
"----------------------------------------

"----------------------------------------
" 挿入モード
"----------------------------------------

"----------------------------------------
" ビジュアルモード
"----------------------------------------

"----------------------------------------
" コマンドモード
"----------------------------------------

"----------------------------------------
" Vimスクリプト
"----------------------------------------

""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

"--------------------------------
"挿入モード時、ステータスラインの色を変更
"--------------------------------
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

if has('unix') && !has('gui_running')
  " ESC後にすぐ反映されない対策
  inoremap <silent> <ESC> <ESC>
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"criptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"----------------------------------------
"Gitvの設定
"----------------------------------------
" ハッシュ値を取得する
function! s:gitv_get_current_hash()
   return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

" 折りたたみを簡単に操作できるように
autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
      setlocal foldenable!
  endif
endfunction

autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  " 現在のカーソル位置にあるブランチ名を取得してログ上でブランチに checkout する
  setlocal iskeyword+=/,-,.
  nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  " 現在のカーソル行の SHA1 ハッシュを取得してログ上であらゆることを実行する
  nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
  " ファイルの diff じゃなくて変更されたファイルの一覧が見たい
  nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction
