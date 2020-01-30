" 参考
" https://d-ebi.hatenablog.com/entry/2018/11/08/210000

" デフォルトの文字コードをUTF-8へ
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

set clipboard=unnamed,autoselect            " ヤンクやペースト時クリップボードの内容を使用する
set nobackup                                " バックアップファイルを作らない
set noswapfile                              " スワップファイルを作らない

set cursorcolumn                            " 現在の行を強調表示（縦）

set incsearch                               " インクリメンタルサーチを有効にする
set hlsearch                                " 検索結果のハイライト

set number                                  " 行番号を表示
set ruler                                   " ルーラーを表示(設定しても見た目は変わらない気がする。。)
" set expandtab                               " タブをスペースに展開する

set autoread                                " 内容が変更されていたら自動的に再読み込み

set backspace=indent,eol,start              " バックスペースでインデントや改行を削除できるようにする

set nowrap                                  " 折返ししない

:set cmdheight=2                            # これを設定すると保存時の Press Enter～のメッセージが表示されなくなる
nnoremap <Esc><Esc> :noh<CR>                " <Esc><Esc>で検索結果のハイライトを消す


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


function! HankakuSpace()
  highlight HankakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup HankakuSpace
    autocmd!
    " HankakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call HankakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match HankakuSpace / /
    autocmd VimEnter,WinEnter * match HankakuSpace '\%uff65'
  augroup END
  call HankakuSpace()
endif

" Tab、行末の半角スペースを明示的に表示する。
set list
" set listchars=tab:>-,extends:<,trail:-,eol:<

" 半角スペースを表示する
set listchars=space:·
highlight WhiteSpaceBol guifg=darkgrey
highlight WhiteSpaceMol guifg=darkgrey
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/