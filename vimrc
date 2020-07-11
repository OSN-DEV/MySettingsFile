" 参考
" https://d-ebi.hatenablog.com/entry/2018/11/08/210000

set nocompatible                                    " vi互換を無効にする(これがないと割と辛い)
let $HOME= $VIM . '\home'                           " ホームディレクトリをC:\Users\{User}から変更

set encoding=utf-8                                  " デフォルトの文字コードをUTF-8に変更
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis     " デフォルトの文字コードをUTF-8に変更
set fileformat=dos
set fileformats=dos,unix,mac

set nobackup                                        " バックアップファイルを作らない
set noswapfile                                      " スワップファイルを作らない

" set cursorcolumn                                    " 現在の行を強調表示（縦）

set incsearch                                       " インクリメンタルサーチを有効にする
set hlsearch                                        " 検索結果のハイライト

set number                                          " 行番号を表示
set ruler                                           " ルーラーを表示(設定しても見た目は変わらない気がする。。)
" set expandtab                                       " タブをスペースに展開する

set clipboard=unnamed,autoselect                    " ヤンクやペースト時クリップボードの内容を使用する
set autoread                                        " 内容が変更されていたら自動的に再読み込み
set backspace=indent,eol,start                      " バックスペースでインデントや改行を削除できるようにする
" set nowrap                                          " 折返ししない
" set undolevels=10                                   " UNDOの回数
set smartindent                                     " C言語風の自動インデントを有効にする

set ambiwidth=double                                " 全角記号の表示崩れの対応

" nnoremap <Esc><Esc> :noh<CR>                        " <Esc><Esc>で検索結果のハイライトを消す。gvimではカーソルが移動してしまうので一旦保留

colorscheme molokai

""""""""""""""""""""""""""""""
"全角スペースを表示
"https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color?tmpl=%2Fsystem%2Fapp%2Ftemplates%2Fprint%2F&showPrintDialog=1
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932

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
    autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
  augroup END
  call ZenkakuSpace()
endif


" Tab、行末の半角スペースを明示的に表示する。
" https://qiita.com/pollenjp/items/459a08a2cc59485fa08b
set list
" set listchars=tab:»-,trail:·,eol:↲,extends:»,precedes:«,nbsp:%,space:·
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:･,space:･,trail:･
hi NonText    guibg=NONE guifg=lightgrey
hi SpecialKey guibg=NONE guifg=lightgrey



""""""""""""""""""""""""""""""
" plug in(https://github.com/junegunn/vim-plug)
""""""""""""""""""""""""""""""
let g:cheatsheet#cheat_file = '$VIM\home\cheat.md'

" vimを起動して :PlugInstall と記述しないとインストールされないらしい
" :set rtp? でruntimepathの設定を確認出来る
" :PlugStatus でプラグインの状況を確認できる

call plug#begin('$VIM/vimfiles/plugged')        " パスを指定しないと$HOMEの設定を変更しているにも関わらずC:/Usersにプラグインがインストールされる

Plug 'scrooloose/nerdtree'                      " :NERDTreeコマンドで ファイルをtree表示してくれる
Plug 'reireias/vim-cheatsheet'                  " :Cheatでチートシートに設定したファイルを表示する

call plug#end()

