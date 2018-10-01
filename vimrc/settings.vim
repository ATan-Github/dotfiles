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


"================ gVim Options ==============="

if has("gui_running")
    set guioptions-=L
    set guioptions-=R
    set guioptions-=T
    function! ScreenFilename()
        if has('amiga')
            return "s:.vimsize"
        elseif has('win32')
            return $HOME.'\_vimsize'
        else
            return $HOME.'/.vimsize'
        endif
    endfunction

    function! ScreenRestore()
        " Restore window size (columns and lines) and position
        " from values stored in vimsize file.
        " Must set font first so columns and lines are based on font size
        let f = ScreenFilename()
        if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
            let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
            for line in readfile(f)
                let sizepos = split(line)
                if len(sizepos) == 5 && sizepos[0] == vim_instance
                    silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
                    silent! execute "winpos ".sizepos[3]." ".sizepos[4]
                    return
                endif
            endfor
        endif
    endfunction

    function! ScreenSave()
        " Save window size and position.
        if has("gui_running") && g:screen_size_restore_pos
            let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
            let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
                                    \ (getwinposx()<0?0:getwinposx()) . ' ' .
                                    \ (getwinposy()<0?0:getwinposy())
            let f = ScreenFilename()
            if filereadable(f)
                let lines = readfile(f)
                call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
                call add(lines, data)
            else
                let lines = [data]
            endif
            call writefile(lines, f)
        endif
    endfunction

    if !exists('g:screen_size_restore_pos')
        let g:screen_size_restore_pos = 1
    endif
    if !exists('g:screen_size_by_vim_instance')
        let g:screen_size_by_vim_instance = 1
    endif
    autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
    autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif





