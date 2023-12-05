"""""""""""""""""""""""""""""""""""""
" エンコーディング
"""""""""""""""""""""""""""""""""""""

"書き込み時の文字コードをUFT-8に設定
set fileencoding=utf-8

" 読み込む時のエンコードを指定
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp

" ファイルタイプを自動で検知する
filetype on


"""""""""""""""""""""""""""""""""""""
" 基本設定
"""""""""""""""""""""""""""""""""""""

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

" コマンドラインの履歴を10000件保存する
set history=10000

" 挿入モードでautoindent, 改行, 挿入区間の始めを超えて<BS>, <Del>, CTRL-W, CTRL-Uを動作
set backspace=indent,eol,start

" 上下n行見える状態でスクロール
set scrolloff=5

" マウスでカーソル移動
set mouse=a


"""""""""""""""""""""""""""""""""""""
" 表示
"""""""""""""""""""""""""""""""""""""

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 行番号を表示
set number

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" インデントはスマートインデント
set smartindent

" ビープ音を可視化
set visualbell

" 括弧入力時の対応する括弧を表示
set showmatch

" コマンドラインの補完
set wildmode=list:longest

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" シンタックスハイライトの有効化
syntax enable

" コメントの色を指定
hi Comment ctermfg=gray

" ステータスラインを常に表示
set laststatus=2


"""""""""""""""""""""""""""""""""""""
" Tab
"""""""""""""""""""""""""""""""""""""

" 不可視文字を可視化(改行、タブ、行末に続くスペース)
set list
set listchars=eol:↲,tab:»-,trail:_

" Tab文字を半角スペースにする
set expandtab

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2

" 行頭でのTab文字の表示幅
set shiftwidth=2


"""""""""""""""""""""""""""""""""""""
" 検索
"""""""""""""""""""""""""""""""""""""

" 大文字と小文字を区別せずに検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"""""""""""""""""""""""""""""""""""""
" Undoの永続化
"""""""""""""""""""""""""""""""""""""

" ~/.vim/undoディレクトリ配下に変更履歴を保存
" ファイルを閉じても変更履歴が残るようにする
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')

  " ディレクトリが存在しなければディレクトリを作成
  if !isdirectory(undo_path)
    call mkdir(undo_path, 'p')
  endif

  exe 'set undodir=' .. undo_path
  set undofile
endif


"""""""""""""""""""""""""""""""""""""
" 入力の設定
"""""""""""""""""""""""""""""""""""""

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" ヤンク、プットするときにクリップボードを使用できるようにする
set clipboard+=unnamed

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" <Leader>というプレフィックスキーにスペースを使用する
let g:mapleader = "\<Space>"

" スペース + wでファイル保存
nnoremap <Leader>w :w<CR>

" 入力モード時のカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 文字の削除、置き換え時yankしないようにする
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S
xnoremap <expr> p 'pgv"'.v:register.'y`>'


" 日本語入力後にインサートモードを抜けると自動でIMEを無効にする
" IMEをコマンド経由で変更できるim-selectというソフトウェアが必要
" hammerspoonで実現したのでコメントアウト (2023-12-01)
" brew tap daipeihust/tap
" brew install im-select
" autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC


" 複数画面の移動をスペースで
nmap <Space> <C-w>w

" 画面サイズの変更は矢印でも
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" ;でコマンドモードに入る
nnoremap ; :

" カーソルのあるウインドウを最大化する
nnoremap <Space>o    <C-W>o

" カーソルのあるウインドウを隠す
nnoremap <silent><Space>h    :hide<CR>

" ファイル保存:バッファ変更時のみ保存
nnoremap <silent><Space>s    :<C-u>w<CR>

" 直近開いたファイルを開く
nnoremap <Leader>e  :<C-u>/ oldfiles<Home>browse filter /


"""""""""""""""""""""""""""""""""""""
" プラグインマネジャー vim-jetpack
"""""""""""""""""""""""""""""""""""""

" https://github.com/tani/vim-jetpack を自動インストール
" https://github.com/tani/vim-jetpack#automatic-installation-on-startup を参考
let s:jetpackfile = '~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

" プラグインを設定
packadd vim-jetpack
call jetpack#begin()
  "https://github.com/tani/vim-jetpack
  Jetpack 'tani/vim-jetpack', {'opt': 1}

  " Copilotをvimで使えるようにする
  Jetpack 'github/copilot.vim'

  " ChatGPTをvimで使えるようにする
  " denoが必要なのでasdfでdenoを入れておく
  " asdf plugin-add deno
  " asdf install deno latest
  " asdf global deno latest
  Jetpack 'vim-denops/denops.vim'
  Jetpack 'takavfx/gptwriter.vim'

  " ステータスラインをカスタマイズ
  Jetpack 'itchyny/lightline.vim'

  " バッファをタブとして表示
  Jetpack 'mengelbrecht/lightline-bufferline'

  " gitの操作をvimで行えるようにする
  " ステータスラインにブランチを表示するために使用
  Jetpack 'tpope/vim-fugitive'

  " Pure Vimscriptで書かれたLSPクライアント
  " vim-lsp-settingsを書いたmattnさんの記事をみて導入
  " https://qiita.com/mattn/items/e62b9f16bc487a271a7f
  Jetpack 'prabirshrestha/vim-lsp'
  Jetpack 'mattn/vim-lsp-settings'

  " LSPの補完
  Jetpack 'prabirshrestha/asyncomplete.vim'
  Jetpack 'prabirshrestha/asyncomplete-lsp.vim'

  " ほぼ全てのフォーマットを網羅してるsyntax highlight
  Jetpack 'sheerun/vim-polyglot'

  " Python
  " PEP8に準拠したインデント
  Jetpack 'Vimjas/vim-python-pep8-indent'
call jetpack#end()


"""""""""""""""""""""""""""""""""""""
" 'itchyny/lightline.vim'の設定
"""""""""""""""""""""""""""""""""""""

let g:lightline = {
\     'colorscheme': 'wombat',
\     'active': {
\       'left': [
\         ['mode', 'paste'],
\         ['gitbranch', 'readonly', 'filename', 'modified'],
\       ],
\       'right': [
\         ['lsp_errors', 'lsp_warnings', 'lsp_ok'],
\         ['lineinfo', 'syntastic'],
\         ['percent'],
\         ['charcode', 'fileformat', 'fileencoding', 'filetype'],
\       ]
\     },
\     'component_function': {
\       'gitbranch': 'FugitiveHead',
\       'lsp_warnings': 'LightlineLSPWarnings',
\       'lsp_errors':   'LightlineLSPErrors',
\       'lsp_ok':       'LightlineLSPOk',
\     },
\     'component_type': {
\       'lsp_warnings': 'warning',
\       'lsp_errors':   'error',
\       'lsp_ok':       'middle',
\     },
\   }

" vim-lspの結果をステータスラインに表示する
function! LightlineLSPWarnings() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.warning == 0 ? '' : printf('W:%d', l:counts.warning)
endfunction

function! LightlineLSPErrors() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.error == 0 ? '' : printf('E:%d', l:counts.error)
endfunction

function! LightlineLSPOk() abort
  let l:counts =  lsp#get_buffer_diagnostics_counts()
  let l:total = l:counts.error + l:counts.warning
  return l:total == 0 ? 'OK' : ''
endfunction

" tablineの設定
" 常にタブを表示する
set showtabline=2

" タブの表示をカスタマイズ
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}


"""""""""""""""""""""""""""""""""""""
" lfを使うための設定
"""""""""""""""""""""""""""""""""""""
function! LF()
    let temp = tempname()
    exec 'silent !lf -selection-path=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar LF call LF()

" lfを起動するキーバインド
nnoremap <leader>f :LF<cr>



"""""""""""""""""""""""""""""""""""""
" bufferの操作
" 'bagrat/vim-buffet'を使用する
"""""""""""""""""""""""""""""""""""""
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>


"""""""""""""""""""""""""""""""""""""
" 'prabirshrestha/asyncomplete.vim'
"""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"



"""""""""""""""""""""""""""""""""""""
" Copilot
"""""""""""""""""""""""""""""""""""""

" markdwon, gitcommitでもcopilotを使えるようにする
let g:copilot_filetypes = {'markdown': v:true, 'gitcommit': v:true}


"""""""""""""""""""""""""""""""""""""
" 'takavfx/gptwriter.vim'
"""""""""""""""""""""""""""""""""""""

" ChatGPTのAPIキーを設定
" APIキーを環境変数に設定してvimrcから参照
let g:gptwriter_key = $OPENAI_API_KEY



