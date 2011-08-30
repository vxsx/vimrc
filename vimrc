" Pathogen initialization"{{{
    source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()
"}}}
" Basic rules "{{{
    set nocompatible

    " the title of the window will be set to the value of 'titlestring'
    " (if it is not empty), or to: filename [+=-] (path) - VIM
    set title
    set nospell

    " make it easy
    nmap <Space> :
"}}}
" Appearance "{{{
set ruler
    syntax on
    set synmaxcol=2048 " Syntax coloring lines that are too long just slows down the world
    set cursorline

    set visualbell
    set scrolloff=3

    set rnu

    " Status bar "{{{
        set laststatus=2
        set statusline=[%n]\ %f\ %w%m%r%{fugitive#statusline()}
        "set statusline+=%=%-16(\ %l,%c%V\ %)%P
        "set statusline=\ %<%-15.25(%f%)%m%r%h\ %w\ \ 
        "set statusline+=\ \ \ [%{&ff}/%Y]%=file=%{&fileencoding}\ enc=%{&encoding}\ 
        set statusline+=\ \ \ %<%.99(%{hostname()}:%{CurDir()}%)\ 
        set statusline+=\ \ \ %=%-10.(%l,%c%V%)\ %p%%/%L

        fun! CurDir()
            let curdir = substitute(getcwd(), $HOME, "~", "")
            return curdir
        endfunction
    "}}}
    " Colorscheme "{{{
        let g:solarized_visibility="low"
        let g:solarized_contrast="high"
        let g:solarized_termtrans = 1
        let g:solarized_diffmode="high"
        set background=dark
        color solarized
    "}}}

"}}}
" Encoding "{{{
    set fileencodings=utf8,cp1251
    set encoding=utf-8
    menu Encoding.UTF-8          :e ++enc=utf-8<CR>
    menu Encoding.KOI8-R         :e ++enc=koi8-r<CR>
    menu Encoding.KOI8-U         :e ++enc=koi8-u<CR>
    menu Encoding.CP1251         :e ++enc=cp1251<CR>
    menu Encoding.IBM-855        :e ++enc=ibm855<CR>
    menu Encoding.IBM-866        :e ++enc=ibm866<CR>
    menu Encoding.ISO-8859-5     :e ++enc=iso-8859-5<CR>
    menu Encoding.Latin-1        :e ++enc=latin1<CR>
    map <F2> :emenu Encoding.
"}}}
" Whitespace and indentation "{{{
    set nowrap

    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab

    " Invisible characters
    set list
    if has('multi_byte')
        if version >= 700
            set listchars=tab:\ \ ,trail:·,extends:→,nbsp:×
        else
            set listchars=tab:\ \ ,trail:·,extends:>,nbsp:_
        endif
    endif
    if has("linebreak")
        let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
    endif

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start

    " load the plugin and indent settings for the detected filetype
    filetype plugin indent on

    " Indent ala Textmate
    imap <D-[> <ESC><<
    imap <D-]> <ESC>>>
    nmap <D-[> <<
    nmap <D-]> >>
    vmap <D-[> <gv
    vmap <D-]> >gv

    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Strip trailing whitespace
    function! StripWhitespace ()
        exec ':%s/ \+$//gc'
    endfunction
    map <Leader>s :call StripWhitespace ()<CR>
"}}}
" Searching"{{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    nmap <silent> <Leader><Space> :noh<CR> "mapping to disable search highlight
"}}}
" Tab completion"{{{
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc
"}}}
" Window manipulation "{{{
    set splitbelow
    set splitright

    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l

    " Window resizing mappings "{{{
        nnoremap <S-Up>    5<C-w>+
        nnoremap <S-Down>  5<C-w>-
        nnoremap <S-Left>  5<C-w><
        nnoremap <S-Right> 5<C-w>>
    "}}}
    " Tabs mappings "{{{
        nnoremap <Leader>[ gT
        nnoremap <Leader>] gt
    "}}}
"}}}
" Folding "{{{
    set foldenable                " Turn on folding
    set foldmethod=manual
    "set foldlevel=100             " Don't autofold anything (but I can still fold manually)

    set foldopen=block,hor,tag    " what movements open folds
    set foldopen+=percent,mark
    set foldopen+=quickfix
"}}}
" Files manipulation "{{{
    nnoremap <leader>w   <C-w>v
    nnoremap <leader>v   <C-w>v
    nnoremap <leader>s   <C-w>s:e
    nnoremap <leader>we  <C-w>v:e <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>se  <C-w>s:e <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>ve  <C-w>v:e ~/.vim/vimrc<CR>
    nnoremap <leader>vge <C-w>v:e ~/.vim/gvimrc<CR>

    " Opens an edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>e
    map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

    " Opens a tab edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>t
    map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

    " Inserts the path of the currently edited file into a command
    " Command mode: Ctrl+P
    cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

    " cd to the directory containing the file in the buffer
    nmap  <leader>cd :lcd <C-R>=expand("%:p:h")<CR><CR>

    " Moving in file "{{{
        imap <C-h> <C-o>h
        imap <C-j> <C-o>j
        imap <C-k> <C-o>k
        imap <C-l> <C-o>l

        nmap <tab> %
        vmap <tab> %

        " this is for learning hjkl moving
        nnoremap <up>    <nop>
        nnoremap <down>  <nop>
        nnoremap <left>  <nop>
        nnoremap <right> <nop>
        inoremap <up>    <nop>
        inoremap <down>  <nop>
        inoremap <left>  <nop>
        inoremap <right> <nop>

        " Move in insert mode like in command line
        imap <C-e> <C-o>A
        imap <C-a> <C-o>I
    "}}}
    " File formatting "{{{
        set fo-=o  " Do not insert the current comment leader after hitting 'o' or 'O' in Normal mode.
        set fo+=r  " Automatically insert a comment leader after an enter
    "}}}
    " Remember last location in file "{{{
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
    endif
    "}}}
"}}}
" Filetype autocommands "{{{
    if has("autocmd")
        " make uses real tabs
        au FileType make  set noexpandtab
        " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
        au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
        " md, markdown, and mk are markdown and define buffer-local preview
        au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn}  map <buffer> <Leader>p :Hammer <CR>
        " make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
        au FileType python  set tabstop=4 textwidth=79
        au BufNewFile,BufRead *.tt set ft=html.css
        " That's so i have my css snippets in scss files
        au BufNewFile,BufRead *.scss set ft=scss.css
        " Reload snippets when editing snippets file
        au! BufWritePost *.snippet call ReloadAllSnippets()
        au! bufwritepost vimrc source $MYVIMRC
    endif
"}}}
" Directories for swp files "{{{
    set backupdir=~/.vim/backup
    set directory=~/.vim/backup
    set undofile
    set undodir=~/.vim/backup
"}}}
" Cyrillic keys mappings "{{{
    map ё `
    map й q
    map ц w
    map у e
    map к r
    map е t
    map н y
    map г u
    map ш i
    map щ o
    map з p
    map х [
    map ъ ]
    map ф a
    map ы s
    map в d
    map а f
    map п g
    map р h
    map о j
    map л k
    map д l
    map ж ;
    map э '
    map я z
    map ч x
    map с c
    map м v
    map и b
    map т n
    map ь m
    map б ,
    map ю .
    "map . /

    map Ё ~
    map Й Q
    map Ц W
    map У E
    map К R
    map Е T
    map Н Y
    map Г U
    map Ш I
    map Щ O
    map З P
    map Х {
    map Ъ }
    map Ф A
    map Ы S
    map В D
    map А F
    map П G
    map Р H
    map О J
    map Л K
    map Д L
    map Ж :
    map Э "
    map Я Z
    map Ч X
    map С C
    map М V
    map И B
    map Т N
    map Ь M
    map Б <
    map Ю >
    "map , ?
"}}}
" Include user's local vim config "{{{
    if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
    endif
"}}}
" Plugins "{{{

    " Unimpaired "{{{
        " Bubble single lines
        nmap <D-k> [e
        nmap <D-j> ]e
        " Bubble multiple lines
        vmap <D-k> [egv
        vmap <D-j> ]egv
    "}}}
    " YankRing "{{{
        :nnoremap <silent> <F11> :YRShow<CR>
        let g:yankring_history_dir = '~/.vim/backup'
    "}}}
    " SnipMate "{{{
        let g:snippets_dir = '~/.vim/bundle/_/snippets'
    "}}}
    " NerdCommenter "{{{
        map // <plug>NERDCommenterToggle<CR>
    "}}}
    " NERDTree "{{{
        let NERDTreeIgnore=['\.rbc$', '\~$']
        map <Leader>n :NERDTreeToggle<CR>
    "}}}
    " Command-T "{{{
        let g:CommandTMaxHeight=20
    "}}}
    " ZoomWin configuration "{{{
        map <Leader><Leader> :ZoomWin<CR>
    "}}}
    " Taglist "{{{
        map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    "}}}
    " Fugitive "{{{
        autocmd User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<CR> |
          \ endif
        autocmd BufReadPost fugitive://* set bufhidden=delete
    "}}}
    " ZoomWin "{{{
        " Without setting this, ZoomWin restores windows in a way that causes
        " equalalways behavior to be triggered the next time CommandT is used.
        " This is likely a bludgeon to solve some other issue, but it works
        set noequalalways
    "}}}
    " BufExplorer "{{{
        map <silent> <Leader>b :BufExplorer<CR>
        map <silent> <Space>b :BufExplorer<CR>
        let g:bufExplorerSortBy='extension'
    "}}}
    " Gundo "{{{
        nnoremap <Leader>gu :GundoToggle<CR>
    "}}}
" }}}
" Disabled options "{{{
    " Setting this below makes it sow that error messages don't disappear after one second on startup.
    "set debug=msg


    " The following beast is something i didn't write... it will return the 
    " syntax highlighting group that the current "thing" under the cursor
    " belongs to -- very useful for figuring out what to change as far as 
    " syntax highlighting goes.
    " nmap <silent> <Leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"}}}

" vim:foldmethod=marker:foldlevel=0
