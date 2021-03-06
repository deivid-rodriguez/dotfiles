"-------------------------------------------------------------------------------
" My .vimrc file
"
" author: David Rodríguez de Dios
"-------------------------------------------------------------------------------

" Start requiring plugins
call plug#begin()

"===============================================================================
" Enabled plugins
"===============================================================================

" Colorscheme
Plug 'freeo/vim-kalisi'

" Syntax checker
Plug 'w0rp/ale'

" Fuzzy file, buffer, mru, tag finder
Plug 'kien/ctrlp.vim'

" BufExplorer
Plug 'jlanzarotta/bufexplorer'

" Docker syntax
Plug 'docker/docker', { 'rtp': '/contrib/syntax/vim/' }

" Ruby enhancements
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

" Edition enhancements
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

" Markdown enhancements
Plug 'plasticboy/vim-markdown'

" Slim template engine syntax
Plug 'slim-template/vim-slim'

" CoffeeScript enhancements
Plug 'kchmck/vim-coffee-script'

" Typescript enhancements
Plug 'leafgarland/typescript-vim'

" Ctags generation
Plug 'szw/vim-tags'

" Track UltiSnips (the engine)
Plug 'SirVer/ultisnips'

" Fast tests in vim
Plug 'janko-m/vim-test'

" Handlebars
Plug 'mustache/vim-mustache-handlebars'

" Finish requiring Vundle plugins
call plug#end()

" Enable filetype detection and filetype-specific indenting & plugins.
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Debug syntax highlighting issues
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"===============================================================================
" General editing configurations
"===============================================================================

" Set map leader
let mapleader = ','
let g:mapleader = ','

set history=700
set mousehide
set nowrap
set textwidth=80
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
set autoindent            " indent from last line when starting new line
set incsearch
set noignorecase
set wildmode=list:longest " bash-like completion
set exrc                  " enable per-directory .vimrc files
set secure                " disable unsafe commands in local .vimrc files
set mouse=a
set mousemodel=popup

"
" Syntax
"
let g:ale_linters = {
  \ 'bash': ['shellcheck'],
  \ 'eruby': ['erb'],
  \ 'javascript': ['eslint'],
  \ 'markdown': ['mdl'],
  \ 'ruby': ['rubocop'],
  \ 'scss': ['stylelint'],
  \ 'yaml': ['yamllint'],
  \}

let g:ale_ruby_rubocop_executable = "bundle"
let g:ale_markdown_mdl_executable = "bundle"

"
" Swap files
"
set nobackup
set nowb
set noswapfile

"
" bufexplorer
"
map ,e :BufExplorer<CR>
map ,s :BufExplorerHorizontalSplit<CR>
map ,v :BufExplorerVerticalSplit<CR>

"
" vim-test
"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:test#preserve_screen = 1
let test#strategy = "neovim"

"
" Misc maps
"

" reload file.
map <leader>r :e %<CR>

" quickly close buffer
map <leader>q :bd<CR>

" quickly save buffer
map <leader>w :w<CR>

" copy word to system selection registers
map <leader>c "*yw

"
" Paste mode
"
set pastetoggle=<F9>

"
" Settings for specific files
"
autocmd BufNewFile,BufRead *.js.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.arb set filetype=ruby

"
" Filetype configurations
"
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType diff set nowrap textwidth=0

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

autocmd FileType make set noexpandtab
autocmd FileType make set nolist

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"
" Ctrl-P
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'

"
" Markdown
"
let g:vim_markdown_folding_disabled = 1

"
" Json
"
com! FormatJSON %!python -m json.tool

"
" Handlebars
"
let g:mustache_abbreviations = 1

"
" Colorscheme
"
colorscheme kalisi

"
" Grepping tool
"
set grepprg=rg
