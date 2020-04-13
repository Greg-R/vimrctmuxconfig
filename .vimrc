set nocompatible " Use modern VIM.
syntax on

filetype plugin on " Apparently required for full functionality. 
packloadall   " Load all plugins.
silent! helptags ALL  " Load help files for all plugins.

let g:slime_target = "vimterminal"

runtime macros/matchit.vim " Required for Julia-vim

"autocmd vimenter * NERDTree
autocmd vimenter * if &filetype ==# 'julia' | NERDTree | endif

set number

"term

"  Close NERDTree if it is the only buffer open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Easy navigation of splits with <Ctrl> + hkjl
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

set foldenable  "  Enable folding
set foldlevelstart=0  "If set to 0, all folds will be closed.
set foldnestmax=10
set foldmethod=manual  " Defines the type of folding.
"  Enable persistent folding.  Run the command mkview to save folds.
augroup auto_save_folds
autocmd!
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview

" Notes on installing plug-ins.  Try to use indigenous VIM manager!
" Plug-ins will go into this directory:
" ~/.vim/pack/plugins/start
" git clone the plug-in to the above directory.
" As of April 7 2020 using:
" nerdtree julia-vim

