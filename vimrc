"ui config
set mouse=a	"enable mouse support
	"set cursorline	"display a line under the current cursor position
set wildmenu 	"display the list of files you can cycle through in, e.g., :e
set showmatch	"higlight matching {[(
set autoindent

"search related
set incsearch	"search as characters are entered
set hlsearch	"highlight search matches

"enable relative numbering on opening a file
set rnu

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
nnoremap <leader>fs :setl foldmethod=syntax<cr>
nnoremap <leader>fm :setl foldmethod=manual<cr>

"displays a line under the cursor
set cursorline
"autowrites the file upon calling make
set autowrite
"reduce the update time from the default 4 seconds to 100 miliseconds
"necessary for git gutter diff markers as of now
set updatetime=100
"to show the commands being typed on screen
set showcmd
"disable cscope errors 
set nocscopeverbose

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
Plug 'fatih/vim-go'
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
Plug 'justinmk/vim-syntax-extra'
Plug 'sheerun/vim-polyglot'

"find ideal positions to jump to
Plug 'unblevable/quick-scope'

""" Custom text objects
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-function'
"
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
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

" custom colorscheme linking
highlight link Function GruvboxBlue
highlight link QuickScopeSecondary GruvboxAquaBold
" highlight link QuickScopeSecondary GruvboxOrangeBold
" highlight link QuickScopePrimary GruvboxRedBold

set list 
set lcs=tab:\|\ 
" set lcs=tab:├─
"hi SpecialKey ctermfg=66 guifg=#649A9A

" richer colouring for golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_auto_sameids = 1

" change go fmt command to `gofmt -s`
let g:go_fmt_command = "gofmt"
let g:go_fmt_options = "-s"

"shorter update time for live preview
autocmd Filetype tex setl updatetime=1
"use Preview as the pdf viewer for tex pdf previews
let g:livepreview_previewer = 'open -a Preview'
let g:polyglot_disabled = ['latex']

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
\ }
