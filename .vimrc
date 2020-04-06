set nocompatible " Use modern VIM.
syntax on

"filetype plugin indent on " Is this required for filetype plugins?

silent! helptags ALL

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
