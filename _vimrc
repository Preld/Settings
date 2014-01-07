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
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

"----------------------------------------
" 入力補完機能の設定
"----------------------------------------
NeoBundle 'Shougo/neocomplcache'
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" カーソル移動中に自動補完しない
let g:neocomplcache_enable_insert_char_pre = 1

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()
" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" Avoid crash by editing python source
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.python = ''
let g:neocomplcache_omni_patterns.ruby = ''

"----------------------------------------
" NerdTreeの設定
"----------------------------------------
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

"----------------------------------------
" Web Coding 用 plugin
"----------------------------------------
" http://qiita.com/alpaca_taichou/items/056a4c42fe7a928973e6
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle 'kchmck/vim-coffee-script'

"----------------------------------------
" コメント関連
"----------------------------------------
NeoBundle 'tomtom/tcomment_vim'
"NeoBundle 'taichouchou2/surround.vim'

"----------------------------------------
" Git用
"----------------------------------------
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

filetype plugin indent on     " required!
filetype indent on
syntax on

"----------------------------------------
" カラースキーム
"----------------------------------------
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
" rdark カラースキーム
NeoBundle 'vim-scripts/rdark'
" hybird カラースキーム
NeoBundle 'w0ng/vim-hybrid'

autocmd ColorScheme * highlight Comment ctermfg=230
autocmd ColorScheme * highlight LineNr ctermfg=241
autocmd ColorScheme * highlight Number ctermfg=51
autocmd ColorScheme * highlight constant ctermfg=51
autocmd ColorScheme * highlight Character ctermfg=51
autocmd ColorScheme * highlight Boolean ctermfg=51

"colorscheme mrkn256
colorscheme jellybeans
"colorscheme wombat
"colorscheme mustang
"colorscheme railscasts

"----------------------------------------
" airlineの設定
"----------------------------------------
NeoBundle 'bling/vim-airline'

set t_Co=256 "カラーを256にしないと色が変わらない。

"例えばuniteやvimfilerでairlineを優先するときは.vimrcに以下を追記します
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

" メインの設定
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1
let g:airline_theme_patch_func = 'AirlineThemePatch'
" let g:airline_theme='laederon'
" let g:airline_theme='luna'
" let g:airline_theme='ubaryd'
let g:airline_theme='wombat'
function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
      for colors in values(a:palette.inactive)
        let colors[3] = 245
      endfor
    endif
  endfunction
let g:airline_powerline_fontsa=0
let g:airline_detect_whitespace=0

"----------------------------------------
"キーバインド変更
"----------------------------------------
" 行が折り返されている時上下移動が論理行単位ではなく表示行単位で行われるようにする
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" インサートモードでカーソルキーを使用する
function! s:goback_insert(key)
  return "gi" . a:key . neocomplcache#cancel_popup()
endfunction
nnoremap <expr> OA <SID>goback_insert("\<Up>")
nnoremap <expr> OB <SID>goback_insert("\<Down>")
nnoremap <expr> OC <SID>goback_insert("\<Right>")
nnoremap <expr> OD <SID>goback_insert("\<Left>")

" コマンドラインモードで %% を入力すると現在編集中のファイルのフォルダのパスが展開されるようにする
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

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

" ESCを簡単にする
imap <C-k> <ESC>

"" Esc連打でハイライトを消す
nmap <silent> <C-k><C-k> :nohlsearch<CR><ESC>

" ノーマルモードで改行挿入
nmap <CR> o<ESC>

" ノーマルモードで行頭行末
nmap <C-h> 0
nmap <C-l> $

" ノーマルモードでインデントを入れる
nnoremap <C-t> i<C-t><ESC>
nnoremap <C-d> i<C-d><ESC>
"nnoremap <Tab> <C-t>

"カーソルキーで行末／行頭の移動可能に設定。
set whichwrap=b,s,[,],<,>
nnoremap h <Left>
nnoremap l <Right>
"l を <Right>に置き換えて、折りたたみを l で開くことができるようにする。
if has('folding')
    nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

" カーソル位置の単語をヤンクした単語に置換
nnoremap <silent> cp ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cip ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" 引用符や括弧をセットで入力したときにLeftする
" inoremap {} {}<LEFT>
" inoremap [] []<LEFT>
" inoremap () ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
" inoremap <> <><LEFT>

"----------------------------------------
 " システム設定
"----------------------------------------
"
 "mswin.vimを読み込む
"source $VIMRUN
 
"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set writebackup
"バックアップ/スワップファイルを作成する/しない
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap
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
"
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal

"----------------------------------------
" インデント設定
"----------------------------------------
set tabstop=2
set shiftwidth=2
set expandtab


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

" 指定したCommitページのURLを作成する
augroup Gitv
    autocmd!
    autocmd FileType gitv nnoremap <buffer> G :<C-u>Gbrowse <C-r>=<SID>gitv_get_current_hash()<CR><CR>
augroup END
