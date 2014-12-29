"-------------------------------------------------------------------------------
" My .vimrc file
"
" author: David Rodríguez de Dios
"-------------------------------------------------------------------------------

"===============================================================================
" Plugin Manager (vundle) configuration
"===============================================================================
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

"===============================================================================
" Enabled plugins
"===============================================================================

" Track UltiSnips the engine
Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine
Bundle 'honza/vim-snippets'

" Fuzzy file, buffer, mru, tag finder
Bundle 'kien/ctrlp.vim'

" BufExplorer
Bundle 'jlanzarotta/bufexplorer'

" Ruby Enhancements
Bundle 'vim-ruby/vim-ruby'

" Rails Enhancements
Bundle 'tpope/vim-rails'

" Markdown Enhancements
Bundle 'plasticboy/vim-markdown'

" Slim Template Engine syntax
Bundle 'slim-template/vim-slim'

" All vim.org colorschemes
Bundle 'flazz/vim-colorschemes'

" Ctags generation
Bundle 'szw/vim-tags'

" required right after vundle plugins
filetype plugin indent on

"===============================================================================
" General editing configurations
"===============================================================================
" Set map leader
let mapleader = ','
let g:mapleader = ','

set history=700
set mousehide
set nowrap
set textwidth=79
set tabstop=2             " tab size
set backspace=2           " make backspace work
set list                  " show hidden chars
set listchars=trail:.     " hidden caracthers and how to show them
set shiftwidth=2          " number of spaces to insert when autoindenting
set sta
set softtabstop=0         " disable softtabstop feature
set sr
set expandtab
set autowriteall
set nonumber
set showmode
set ruler                 " show column numbers
set nostartofline         " keep column when scrolling with <C-f>, <C-b>
set nocompatible
set noautoindent          " indent from last line when starting new line
set incsearch
set noignorecase
set wildmode=list:longest " bash-like completion
set encoding=utf-8
set exrc                  " enable per-directory .vimrc files
set secure                " disable unsafe commands in local .vimrc files

"-------------------------------------------------------------------------------
" Syntax
"-------------------------------------------------------------------------------
if has("syntax")
  syntax on

  autocmd BufNewFile,BufRead *.ini silent! set syntax=cfg

  set synmaxcol=500 " No resaltar sintaxis en lineas largas (performance)
endif

"-------------------------------------------------------------------------------
" no backup
"-------------------------------------------------------------------------------
set nobackup
set nowb
set noswapfile

"-------------------------------------------------------------------------------
" bufexplorer
"-------------------------------------------------------------------------------
map ,e :BufExplorer<CR>
map ,s :BufExplorerHorizontalSplit<CR>
map ,v :BufExplorerVerticalSplit<CR>

"-------------------------------------------------------------------------------
" misc maps
"-------------------------------------------------------------------------------
map ,r :e %<CR>                   " reload file.
map ,q :bd<CR>                    " close buffer
map ,w :w<CR>
map ,c :retab<CR> :%s/  *$//<CR>  " clean tabs and spaces at end of line
map ,n j0f"lct"

"-------------------------------------------------------------------------------
" shell profile
"-------------------------------------------------------------------------------
function! EditProfile()
  if g:OS == "Linux"
    exec "edit ~/.bashrc"
  else
    exec "edit ~/.profile"
  endif
endfunction
map .p :call EditProfile()<CR>

"-------------------------------------------------------------------------------
" colorscheme
"-------------------------------------------------------------------------------
if &diff
  colorscheme peaksea
endif

"-------------------------------------------------------------------------------
" Toogle paste mode
"-------------------------------------------------------------------------------
set pastetoggle=<F9>

"-------------------------------------------------------------------------------
" Turn on filetype autocompletion
"-------------------------------------------------------------------------------
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"au BufNewFile,BufRead *.erb set ft=html
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType make set noexpandtab
autocmd FileType make set nolist

"-------------------------------------------------------------------------------
" Configure Ctrl-P
"-------------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"-------------------------------------------------------------------------------
" Configure UltiSnips
"-------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsListSnippets='<c-tab>'

"-------------------------------------------------------------------------------
" Settings for specific dirs
"-------------------------------------------------------------------------------
autocmd BufNewFile,BufRead ~/Proyectos/ruby/* set tabstop=8 nolist

"-------------------------------------------------------------------------------
" Markdown settings
"-------------------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

"-------------------------------------------------------------------------------
" GUI Options
"-------------------------------------------------------------------------------
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
