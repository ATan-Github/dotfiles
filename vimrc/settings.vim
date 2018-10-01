"vim text-editor settings"

set hidden
set background=dark
set termguicolors
colorscheme deep-space
"colorscheme happy_hacking
set t_Co=256

" easy way to get back to normal mode
inoremap jj <ESC>
inoremap kk <ESC>

set ignorecase              " Case insensitive searching
set smartcase               " search case depending on what you input

" tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab


" Better split screen navigation key remap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" More natural splitscrew
set splitbelow
set splitright

		
set number relativenumber		"setting hybrid numbers
:augroup numbertoggle			"relative in normal/visual, absolute in insert
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
