"plugins.vim"

" Auto installs vim-plug manager`
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Calls plugins"
call plug#begin()

"Plug-in List"

"======= Basic Plugins ======="


"Deep Space Color Scheme"
Plug 'tyrannicaltoucan/vim-deep-space'

" Happy Hacking coloscheme
"Plug 'YorickPeterse/happy_hacking.vim'

"Surround - change things inside () [] {}
Plug 'tpope/vim-surround'

" file tree browser
Plug 'scrooloose/nerdtree'

" Sublime-like multiple select
Plug 'terryma/vim-multiple-cursors'

" Aligns selected character"
Plug 'godlygeek/tabular'  

" Indentation guidlines"
Plug 'yggdroot/indentline'



"======= Git Extensions ======="

" nerdtree integration with git
Plug 'Xuyuanp/nerdtree-git-plugin'

" Marks changed, new, and deleted lines "
Plug 'airblade/vim-gitgutter'


"======= Git Extensions ======="



"======= Git Extensions ======="

" Enable airline status bar
Plug 'vim-airline/vim-airline'


"normal/insert/visual label theme"
Plug 'vim-airline/vim-airline-themes'

call plug#end()
