set nocompatible

"-------------------------------------------------------------------------------
" Encodings
"-------------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

"-------------------------------------------------------------------------------
" Search options
"-------------------------------------------------------------------------------
set ignorecase
set smartcase

"-------------------------------------------------------------------------------
" Editing options
"-------------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=2
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM

set number
set ruler
set nolist
set listchars=tab:>.,extends:<,trail:-,eol:<
set nowrap
set laststatus=2
set cmdheight=2
set showcmd
set title

syntax on

"-------------------------------------------------------------------------------
" File options
"-------------------------------------------------------------------------------
set nobackup
"autocmd FileType *
"\   if &l:omnifunc == ''
"\ |   setlocal omnifunc=syntaxcomplete#Complete
"\ | endif

"-------------------------------------------------------------------------------
" tags
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  set tags=./tags,tags
endif

"-------------------------------------------------------------------------------
" Platform dependent
"-------------------------------------------------------------------------------
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  set iskeyword=@,48-57,_,128-167,224-235
endif

"-------------------------------------------------------------------------------
" Vundle rocks!
"-------------------------------------------------------------------------------
filetype on
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

"-------------------------------------------------------------------------------
" Bundles
"-------------------------------------------------------------------------------
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'VimClojure'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'juvenn/mustache.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
"Bundle 'myusuf3/numbers.vim'

filetype plugin indent on
let g:neocomplcache_enable_at_startup=1

"-------------------------------------------------------------------------------
" Plugin settings
"-------------------------------------------------------------------------------
" vim-powerline
let g:Powerline_symbols='fancy'
"let g:Powerline_symbols='unicode'
let g:Powerline_theme='skwp'
"let g:Powerline_colorscheme='skwp'

" HTML tidy
"autocmd FileType html :compiler tidy
"autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
autocmd FileType html :setlocal sw=2 sts=2 

" javascript
autocmd FileType javascript :setlocal sw=2 sts=2 

" clojure
let vimclojure#HighlightBuiltis=1
let vimclojure#ParenRainbow=1

" coffee
au BufWritePost *.coffee silent CoffeeMake!

" ruby
autocmd FileType ruby :setlocal sw=2 sts=2 

" Unite
" 入力モードで開始する
let g:unite_enable_start_insert=1

" quickrun
augroup MyRSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}

"-------------------------------------------------------------------------------
" Print options
"-------------------------------------------------------------------------------
set printoptions=number:y,wrap:y
set printfont=MS_Gothic:h8:cSHIFTJIS

"-------------------------------------------------------------------------------
" Keymaps
"-------------------------------------------------------------------------------
vmap \er :!ruby<CR>
nmap gso vi{:!sortcss<CR>
vmap gso i{:!sortcss<CR>

nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
" registers
nnoremap <Space>r  :<C-u>registers<CR>
" marks
nnoremap <Space>m  :<C-u>marks<CR>
" make
nnoremap <Space>b  :<C-u>mak<CR>
" Tlist
nnoremap <silent> <F8> :TlistToggle<CR>

"nnoremap <F3> :NumbersToggle<CR>

" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file_rec<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" vim:set fenc=utf-8 ts=8 sts=2 sw=2 tw=0:
