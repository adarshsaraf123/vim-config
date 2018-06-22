"ui config
set mouse=a	"enable mouse support
	"set cursorline	"display a line under the current cursor position
set wildmenu 	"display the list of files you can cycle through in, e.g., :e
set showmatch	"higlight matching {[(
set autoindent

"search related
set incsearch	"search as characters are entered
set hlsearch	"highlight search matches

"change leader to comma
let mapleader = ","

"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>	

"use fuzzy search on tags
nnoremap <leader>. :CtrlPTag<cr>
"toggle tagbar
nnoremap <leader>t :TagbarToggle<cr>
"toggle relative numbering
nnoremap <leader>n :setl rnu!<cr>
"toggle tagbar
nnoremap <leader>f :setl foldmethod=syntax<cr>

"displays a line under the cursor
set cursorline
"autowrites the file upon calling make
set autowrite
"reduce the update time from the default 4 seconds to 100 miliseconds
"necessary for git gutter diff markers as of now
set updatetime=100

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim
    https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    endif

"Installing plugins using the `Plug` plugin manager
call plug#begin('~/.vim/plugged')
"git gutter for git changes marked in display
Plug 'airblade/vim-gitgutter'
"fugitive for better display of git changes
Plug 'tpope/vim-fugitive'
"CtrlP fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'
"tagbar for viewing tags
Plug 'majutsushi/tagbar'
"neccessary for vim-session
Plug 'xolox/vim-misc'
"for easy maintainance of sessions
Plug 'xolox/vim-session'
"vim-go for golang support
Plug 'fatih/vim-go', {'on':['GoImport', 'GoDef','GoFmt', 'GoDescribe', 'GoRun', 'GoBuild', 'GoImplements', 'GoCallers', 'GoCallees'], 'do': ':GoUpdateBinaries' }
"vim gruvbox colorscheme
Plug 'morhetz/gruvbox'
"for better status bar display
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"file system explorer
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
"for ack-ing within vim
Plug 'mileszs/ack.vim'
"for linting
Plug 'w0rp/ale'

"for snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'mkitt/tabline.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/mru.vim'
Plug 'chazy/cscope_maps'

"for making quoting/paranthesizing simple
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
call plug#end()

"for gruvbox colorscheme
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"for solarized colorscheme
syntax enable
set background=dark

"to disable the autosave session option with xolox/vim-session plugin
let g:session_autosave = 'no'
"to disable the autoload session option with xolox/vim-session plugin
let g:session_autoload = 'no'
"for displaying gotags using the majutsushi/tagbar plugin
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
" to display the tagbar on the left side of the screen
let g:tagbar_left = 1
let g:NERDTreeWinPos = "right"
nnoremap <C-n> :NERDTreeToggle<CR>

"set list lcs=tab:\|\
"hi SpecialKey ctermfg=66 guifg=#649A9A
