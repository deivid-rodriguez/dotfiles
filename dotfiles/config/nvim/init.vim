"-------------------------------------------------------------------------------
" My .vimrc file
"
" author: David Rodríguez de Dios
"-------------------------------------------------------------------------------

"===============================================================================
" NeoBundle Manager configuration
"===============================================================================
filetype off

" Set the runtime path to include Vundle and initialize
set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

" Start requiring NeoBundle plugins
call neobundle#begin()

" Let NeoBundle manage NeoBundle, required
NeoBundleFetch 'Shougo/neobundle.vim'

"===============================================================================
" Enabled plugins
"===============================================================================

" Colorscheme
NeoBundle 'https://github.com/freeo/vim-kalisi'

" Fuzzy file, buffer, mru, tag finder
NeoBundle 'kien/ctrlp.vim'

" BufExplorer
NeoBundle 'jlanzarotta/bufexplorer'

" Ruby Enhancements
NeoBundle 'vim-ruby/vim-ruby'

" Rails Enhancements
NeoBundle 'tpope/vim-rails'

" Rake enhancements
NeoBundle 'tpope/vim-rake'

" Markdown Enhancements
NeoBundle 'plasticboy/vim-markdown'

" Slim Template Engine syntax
NeoBundle 'slim-template/vim-slim'

" Ctags generation
NeoBundle 'szw/vim-tags'

" Go stuff
NeoBundle 'fatih/vim-go'

" Track UltiSnips (the engine)
NeoBundle 'SirVer/ultisnips'

" Seamless navigation between tmux panes and vim splits
NeoBundle 'christoomey/vim-tmux-navigator'

" Finish requiring Vundle plugins
call neobundle#end()

" Workaround for very slow startup on JRUBY + chruby
let g:ruby_path = system('echo $RUBIES')

" Enable filetype detection and filetype-specific indenting & plugins.
filetype plugin indent on

" Prompt to install missing bundles
NeoBundleCheck

" Remove unused bundles
NeoBundleClean

" Enable syntax highlighting
syntax on

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
set noautoindent          " indent from last line when starting new line
set incsearch
set noignorecase
set wildmode=list:longest " bash-like completion
set encoding=utf-8
set exrc                  " enable per-directory .vimrc files
set secure                " disable unsafe commands in local .vimrc files
set mouse=a
set mousemodel=popup

"-------------------------------------------------------------------------------
" Syntax
"-------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.ini silent! set syntax=cfg

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
" Set & Toogle paste mode
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
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType make set noexpandtab
autocmd FileType make set nolist

"-------------------------------------------------------------------------------
" make YCM compatible with UltiSnips (using supertab)
"-------------------------------------------------------------------------------
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

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
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
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
" Format json easily
"-------------------------------------------------------------------------------
com! FormatJSON %!python -m json.tool

"-------------------------------------------------------------------------------
" Colorscheme
"-------------------------------------------------------------------------------
colorscheme kalisi

"-------------------------------------------------------------------------------
" Grepping tool
"-------------------------------------------------------------------------------
set grepprg=ag