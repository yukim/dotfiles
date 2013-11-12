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
set hlsearch

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
set pastetoggle=<F2>
set noswapfile

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

set wildignore+=*.class,*.zip

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
set rtp+=~/.vim/bundle/vundle/
set rtp+=$GOROOT/misc/vim
call vundle#rc()

"-------------------------------------------------------------------------------
" Bundles
"-------------------------------------------------------------------------------
Bundle 'gmarik/vundle'
Bundle 'VimClojure'
Bundle 'Shougo/neocomplcache'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'juvenn/mustache.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
"Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'

filetype plugin indent on
colorscheme distinguished

"-------------------------------------------------------------------------------
" Plugin settings
"-------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:airline_powerline_fonts = 1

" HTML
"autocmd FileType html :compiler tidy
"autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
autocmd FileType html :setlocal sw=2 sts=2 

" javascript
autocmd FileType javascript :setlocal sw=2 sts=2 ts=2 

" clojure
let vimclojure#HighlightBuiltis=1
let vimclojure#ParenRainbow=1

" coffee
" au BufWritePost *.coffee silent CoffeeMake!

" ChucK
au BufNewFile,BufRead *.ck setf ck 

" ruby
autocmd FileType ruby :setlocal sw=2 sts=2 

" quickrun
augroup MyRSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
let g:quickrun_config.markdown = {
      \ 'outputter': 'null',
      \ 'command'  : 'open',
      \ 'cmdopt'   : '-a',
      \ 'args'     : 'Marked',
      \ 'exec'     : '%c %o %a %s',
      \ }
let g:quickrun_config.html = {'outputter': 'null', 'command': 'open'}

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

nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

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

nmap <F8> :TagbarToggle<CR>
" vim:set fenc=utf-8 ts=8 sts=2 sw=2 tw=0:
