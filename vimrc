" vim config
" Paul Campbell <pacampbell87@gmail.com>

set nu
set nowrap
set signcolumn=yes
set autoread
set hlsearch
set clipboard+=unnamedplus
set fillchars+=vert:│
set lazyredraw
colorscheme gruvbox
set background=dark
set encoding=UTF-8

" When done searching, stop highlighting
nnoremap <silent> <CR> :noh<CR><CR>

" Show whitespace characters
set listchars=eol:¬,tab:»\ ,trail:·,extends:→,precedes:←,space:·
set list

" Highlight selected line
set cursorline

" find fuzzy searching and tab compltetion
set path+=**
set wildmenu

" Remap buffer cycling
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Tag Jumping:
" Make a tags file for your project with the following command
" Note that ctags needs to be installed
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules .

" Once a tag file exists, use the following commands to navigate
" - Use ^]   to jump to a tag under the current cursor.
" - Use g^]  to jump to ambiguous tags.
" - Use ^t   to jump back up the tag stack.
" - Remap ^[ to replace ^t
" nnoremap <c-[> <c-t>

" Auto complete:
" Nothing special for auto complete (it is already built in)
" - Use ^x^n for the current open buffer only.
" - Use ^x^f for filenames.
" - Use ^x^] for tags only.
" - Use ^n for anything specified by the 'complete' option.

" Use ^n and ^p to go back and forth in the suggestion list.

" - Remap omni-complete ^x^o to ^space

" - Remap local-complete ^x^] to ^] in insert mode

" Omni complete:
" - Disable the scratch window completely
set completeopt-=preview

" Remote file browsing and editing:
" Use :edit scp://[user@]host[:port]/[directory]
" Example: scp://localhost/

" Edit file to open a file browser.
" - :edit a folder to open a file browser.
" - <CR>/v/t to open in a new h-split/v-split/tab
" - Check |netrw-browse-maps| for more mappings.

" Adding shift-tab to unident lines
" for command mode
" nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" When we can't live without plugins.
" Use sparingly
call plug#begin('~/.vim/plugged')

" Colors
Plug 'flazz/vim-colorschemes'

" Status bar enhancement
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=0

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" ctrl-p fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_follow_symlinks=2
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore='\v(\.(o|d|a|so|ko|pyc|git|svn|ico|swp|cmd|DS_Store))|(node_modules|__pycache__)'

" " Git integration
Plug 'airblade/vim-gitgutter'
set updatetime=100
"
Plug 'tpope/vim-fugitive'

" Better highlighting for C
Plug 'justinmk/vim-syntax-extra'

" Project specific settings
Plug 'editorconfig/editorconfig-vim'

" File explorer
Plug 'scrooloose/nerdtree'
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeShowHideen=1
let NERDTreeIgnore=['\.o$', '\.ko$', '\.d$', '\.git$', '\.svn$', '\.pyc$', '__pycache__']
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Buffer kill functionality without killing split
Plug 'qpkorr/vim-bufkill'

" Better buffer listing
Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy='B'

" Help with HTML development
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'

" Scratch buffer
Plug 'mtth/scratch.vim'
let g:scratch_persistence_file=1

" Sublime text search capability
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_search_mode='async'
let g:ctrlsf_position='right'
let g:ctrlsf_auto_focus = {'at': 'start'}
" let g:ctrlsf_auto_close = {'normal': 0, 'compact': 0}
let g:ctrlsf_extra_backend_args = {'ack': '--ignore-file=is:tags'}
nnoremap <C-f> :CtrlSF "
nnoremap <S-f> :CtrlSFToggle<CR>

" Better tab completetion
Plug 'ajh17/VimCompletesMe'

call plug#end()

