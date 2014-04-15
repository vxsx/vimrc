" Vundle initialization"{{{
    set nocompatible
    filetype off

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle, required
    Bundle 'gmarik/vundle'

    " Bundles "{{{
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'editorconfig/editorconfig-vim'
        Bundle 'mustache/vim-mustache-handlebars'
        Bundle 'cakebaker/scss-syntax.vim'
        Bundle 'scrooloose/syntastic'
        Bundle 'vim-scripts/TaskList.vim'
        Bundle 'davidoc/taskpaper.vim'
        Bundle 'tomtom/tcomment_vim'
        Bundle 'mileszs/ack.vim'
        Bundle 'pix/vim-align'
        Bundle 'kchmck/vim-coffee-script'
        Bundle 'kien/ctrlp.vim'
        Bundle 'hail2u/vim-css3-syntax'
        Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-git'
        Bundle 'tpope/vim-haml'
        Bundle 'sjl/gundo.vim'
        Bundle 'Yggdroot/indentLine'
        Bundle 'michaeljsmith/vim-indent-object'
        Bundle 'pangloss/vim-javascript'
        Bundle 'tpope/vim-markdown'
        Bundle 'scrooloose/nerdtree'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        Bundle 'garbas/vim-snipmate'
        Bundle 'wavded/vim-stylus'
        Bundle 'ervandew/supertab'
        Bundle 'tpope/vim-unimpaired'
        Bundle 'regedarek/ZoomWin'
        Bundle 'gregsexton/MatchTag'
        Bundle 'vim-scripts/matchit.zip'
        Bundle 'vim-scripts/jQuery'
        Bundle 'othree/html5.vim'
        Bundle 'mattn/emmet-vim'
        Bundle 'vxsx/vim-snippets'
    "}}}

    filetype plugin indent on     " required
"}}}
" Basic rules "{{{
    " the title of the window will be set to the value of 'titlestring'
    " (if it is not empty), or to: filename [+=-] (path) - VIM
    set title
    set nospell
    set mouse=a
    if $TMUX == ''
        set clipboard+=unnamed
    endif

    " make it easy
    nmap <Space> :
"}}}
" Appearance "{{{
set ruler
    syntax on
    set synmaxcol=500 " Syntax coloring lines that are too long just slows down the world
    set cursorline

    set visualbell
    set scrolloff=3
    set showcmd

    set rnu

    " Status bar "{{{
        set laststatus=2
        set statusline=[%n]\ %f\ %w%m%r%{fugitive#statusline()}
        set statusline+=%{HasPaste()}
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        "set statusline+=%=%-16(\ %l,%c%V\ %)%P
        "set statusline=\ %<%-15.25(%f%)%m%r%h\ %w\ \ 
        "set statusline+=\ \ \ [%{&ff}/%Y]%=file=%{&fileencoding}\ enc=%{&encoding}\ 
        set statusline+=\ \ \ %<%.99(%{hostname()}:%{CurDir()}%)\ 
        set statusline+=\ \ \ %=%-10.(%l,%c%V%)\ %p%%/%L

        fun! HasPaste()
            if &paste
                return '[paste]'
            else
                return ''
            endif
        endfunction

        fun! CurDir()
            let curdir = substitute(getcwd(), $HOME, "~", "")
            return curdir
        endfunction
    "}}}
    " Colorscheme "{{{
        let g:solarized_visibility="low"
        let g:solarized_contrast="normal"
        let g:solarized_diffmode="high"
        let g:solarized_termtrans=1
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
" FileFormat "{{{
    menu FileFormat.UNIX         :e ++ff=unix<CR>
    menu FileFormat.DOS          :e ++ff=dos<CR>
    menu FileFormat.Mac          :e ++ff=mac<CR>

    map <S-F2> :emenu FileFormat.
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

    vnoremap < <gv
    vnoremap > >gv

    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Strip trailing whitespace
    function! StripWhitespace ()
        exec ':%s/ \+$//gc'
    endfunction
    map <Leader>sw :call StripWhitespace ()<CR>
"}}}
" Searching and Replacing"{{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    "mapping to disable search highlight
    nmap <silent> <Leader><Space> :noh<CR>

	"always on center of the window
	" nmap n nzz
	" nmap N Nzz
	" nmap * *zz
	" nmap # #zz
	" nmap g* g*zz
	" nmap g# g#zz

    set gdefault "set 'g' by default in commands like :%s/../.../

    " map to fast search/replace
    nnoremap <leader>s :%s//<left>
	
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
        nnoremap <Leader>1 1gt
        nnoremap <Leader>2 2gt
        nnoremap <Leader>3 3gt
        nnoremap <Leader>4 4gt
        nnoremap <Leader>5 5gt
        nnoremap <Leader>6 6gt
        nnoremap <Leader>7 7gt
        nnoremap <Leader>8 8gt
        nnoremap <Leader>9 9gt
    "}}}
"}}}
" Folding "{{{
    set foldenable                " Turn on folding
    set foldmethod=manual
    "set foldlevel=100             " Don't autofold anything (but I can still fold manually)

    set foldopen=block,hor,tag    " what movements open folds
    set foldopen+=percent,mark
    set foldopen+=quickfix,search
"}}}
" Files manipulation "{{{
    nnoremap <leader>w   <C-w>v
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

    " save file with root permissions"
    cmap w!! %!sudo tee > /dev/null %
    cmap ц w

    " Editing files "{{{
        nnoremap K <nop>
        nnoremap K i<CR><ESC>

        set pastetoggle=<F10>


        " html escape/unescape
        " via: http://vim.wikia.com/wiki/HTML_entities
        function HtmlEscape()
          silent s/&/\&amp;/eg
          silent s/</\&lt;/eg
          silent s/>/\&gt;/eg
        endfunction

        function HtmlUnEscape()
          silent s/&lt;/</eg
          silent s/&gt;/>/eg
          silent s/&amp;/\&/eg
        endfunction

        map <silent> <Leader>he :call HtmlEscape()<CR>
        map <silent> <Leader>hu :call HtmlUnEscape()<CR>
    "}}}
    " Moving in file "{{{
        " imap <C-h> <C-o>h
        " imap <C-j> <C-o>j
        " imap <C-k> <C-o>k
        " imap <C-l> <C-o>l

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
        au BufRead,BufNewFile *.yml  set tabstop=2
        au BufNewFile,BufRead *.tt set ft=html.css matchpairs-=<:>
        " That's so i have my css snippets in scss files
        au BufNewFile,BufRead *.scss set ft=scss.css
        " Reload snippets when editing snippets file
        au! BufWritePost *.snippet call ReloadAllSnippets()
        au! bufwritepost vimrc source $MYVIMRC


        au BufRead,BufWinEnter,WinEnter,FocusGained * checktime

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
    " SnipMate "{{{
        let g:snippets_dir = '~/.vim/bundle/vim-snippets/snippets'
    "}}}
    " TComment "{{{
        map <silent> // :TComment<CR>
    "}}}
    " NERDTree "{{{
        let NERDTreeIgnore=['\.rbc$', '\~$']
        map <Leader>n :NERDTreeToggle<CR>
        let NERDTreeChDirMode=0
        "let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        "let NERDTreeKeepTreeInNewTab=1
        "let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
    "}}}
    " ZoomWin configuration "{{{
        map <Leader><Leader> :ZoomWin<CR>
    "}}}
    " Fugitive "{{{
        autocmd User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<CR> |
          \ endif
        autocmd BufReadPost fugitive://* set bufhidden=delete
    "}}}
    " Gundo "{{{
        nnoremap <Leader>gu :GundoToggle<CR>
    "}}}
    " Syntastic "{{{
        let g:syntastic_check_on_open=1
        let g:syntastic_enable_signs=0
        " let g:syntastic_enable_balloons = 1
        let g:syntastic_mode_map = { 'mode': 'passive',
                                   \ 'active_filetypes': ['javascript', 'php'],
                                   \ 'passive_filetypes': [] }
    "}}}
    " IndentLine "{{{
        let g:indentLine_char = '│'
        let g:indentLine_noConcealCursor = 1

        let g:indentLine_color_term = 7
        let g:indentLine_color_gui = '#E4E1D2'

        let g:indentLine_faster = 1

        if &background is# "dark"
            let g:indentLine_color_term = 0
            let g:indentLine_color_gui = '#003540'
        endif
    "}}}
    " Taskpaper "{{{
        hi link taskpaperDone Comment
        hi link taskpaperCancelled Comment
    "}}}
    " Emmet "{{{
        let g:user_emmet_leader_key='<C-e>'

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
