" vim config
" Paul Campbell <pacampbell87@gmail.com>

set nu
set nowrap
set signcolumn=yes
set autoread
set hlsearch
set clipboard+=unnamedplus
set fillchars+=vert:│
set termguicolors
colorscheme gruvbox
set background=dark

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
imap <c-space> <c-x><c-o>

" - Remap local-complete ^x^] to ^] in insert mode
inoremap <c-]> <c-x><c-]>

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
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" ctrl-p fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_follow_symlinks=2
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore='\v(\.(o|d|a|so|ko|git|svn|ico|swp|cmd|DS_Store))|(node_modules)'

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
autocmd vimenter * NERDTree
let NERDTreeShowHideen=1
let NERDTreeIgnore=['\.o$', '\.dS', '\.git$', '\.svn$']
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

call plug#end()

