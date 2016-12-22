"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'rbgrouleff/bclose.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

" Language support
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'tclh123/vim-thrift'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set colorcolumn=80                " highlight the 80th column as an indicator
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set hlsearch                      " disable search result highlighting
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set inccommand=split              " enables interactive search and replace
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title

" Set the leader button
let mapleader = ','

" Colors
set background=dark
colorscheme PaperColor

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>

" Clear search highlights
map <leader>c :nohlsearch<CR>

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between buffers with Shift + arrow key
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Closing splits
nnoremap <leader>q :close<CR>

"----------------------------------------------
" Plugin: MattesGroeger/vim-bookmarks
"----------------------------------------------
" Auto save bookmarks
let g:bookmark_auto_save = 1

" Store the bookmarks in the projects
let g:bookmark_save_per_working_dir = 1

" Disable the default key mappings
let g:bookmark_no_default_key_mappings = 1

" Configure key mappings
" This part also fixes conflicts with NERDTree
function! BookmarkMapKeys()
    nmap Mm :BookmarkToggle<CR>
    nmap Mi :BookmarkAnnotate<CR>
    nmap Mn :BookmarkNext<CR>
    nmap Mp :BookmarkPrev<CR>
    nmap Ma :BookmarkShowAll<CR>
    nmap Mc :BookmarkClear<CR>
    nmap Mx :BookmarkClearAll<CR>
    nmap Mkk :BookmarkMoveUp
    nmap Mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap Mm
    unmap Mi
    unmap Mn
    unmap Mp
    unmap Ma
    unmap Mc
    unmap Mx
    unmap Mkk
    unmap Mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

"----------------------------------------------
" Plugin: 'Shougo/deoplete.nvim'
"----------------------------------------------
" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Enable top tab line
let g:airline#extensions#tabline#enabled = 1

"----------------------------------------------
" Plugin: christoomey/vim-tmux-navigator
"----------------------------------------------
" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" Tmux vim integration
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" Move between splits with ctrl+h,j,k,l
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"----------------------------------------------
" Plugin: ctrlpvim/ctrlp.vim
"----------------------------------------------
nnoremap <c-t> :CtrlPBufTag<CR>
nnoremap <c-T> :CtrlPBufTagAll<CR>

" Ignore list
let g:ctrlp_custom_ignore = {
  \ 'dir': 'venv$\|\.git$',
  \ 'file': '\.pyc$'
  \ }

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Add shortcut for toggling the tag bar
nnoremap <F3> :TagbarToggle<CR>

" Language: Go
" Tagbar configuration for Golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"----------------------------------------------
" Plugin: rbgrouleff/bclose.vim
"----------------------------------------------
" Close buffers
nnoremap <leader>w :Bclose<CR>

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

" Files to ignore
let NERDTreeIgnore = [
        \ '\~$',
        \ '\.pyc$',
        \ '^\.DS_Store$',
        \ '^node_modules$',
        \ '^.git$',
        \ '^.ropeproject$',
        \ '^__pycache__$']

" Close vim if NERDTree is the only opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default
let NERDTreeShowHidden = 1

"----------------------------------------------
" Plugin: vimwiki/vimwiki
"----------------------------------------------
" Path to wiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

au FileType vimwiki set shiftwidth=2
au FileType vimwiki set softtabstop=2
au FileType vimwiki set tabstop=2

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Run goimports when running gofmt
au FileType go let g:go_fmt_command = "goimports"

" Enable syntax highlighting per default
au FileType go let g:go_highlight_functions = 1
au FileType go let g:go_highlight_methods = 1
au FileType go let g:go_highlight_structs = 1
au FileType go let g:go_highlight_operators = 1
au FileType go let g:go_highlight_build_constraints = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Mappings
au FileType go nmap <F9> :GoMetaLinter<cr>
au FileType go nmap <F10> <Plug>(go-test)
au FileType go nmap <F11> <Plug>(go-doc-vertical)
au FileType go nmap <F12> <Plug>(go-def)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: LESS
"----------------------------------------------
au FileType less set expandtab
au FileType less set shiftwidth=2
au FileType less set softtabstop=2
au FileType less set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Thrift
"----------------------------------------------
au FileType thrift set expandtab
au FileType thrift set shiftwidth=4
au FileType thrift set softtabstop=4
au FileType thrift set tabstop=4