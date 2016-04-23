" Vundle initialization {{{
    set nocompatible
    filetype off

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle, required
    Bundle 'gmarik/vundle'

    " Bundles {{{
        " Colorschemes {{{
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'morhetz/gruvbox'
            Bundle 'whatyouhide/vim-gotham'
            Bundle 'w0ng/vim-hybrid'
        "}}}
        " Syntax {{{
            Bundle 'mustache/vim-mustache-handlebars'
            Bundle 'cakebaker/scss-syntax.vim'
            Bundle 'kchmck/vim-coffee-script'
            Bundle 'hail2u/vim-css3-syntax'
            Bundle 'othree/html5.vim'
            Bundle 'Glench/Vim-Jinja2-Syntax'
            Bundle 'ekalinin/Dockerfile.vim'
            Bundle 'pangloss/vim-javascript'
            Bundle 'mxw/vim-jsx'
            Bundle 'heavenshell/vim-jsdoc'
            Bundle 'tpope/vim-markdown'
        "}}}
        " Git {{{
            Bundle 'tpope/vim-git'
            Bundle 'tpope/vim-fugitive'
            Bundle 'airblade/vim-gitgutter'
            Bundle 'gregsexton/gitv'
        "}}}
        " UI {{{
            Bundle 'jszakmeister/vim-togglecursor'
            Bundle 'vim-airline/vim-airline'
            Bundle 'vim-airline/vim-airline-themes'

            Bundle 'edkolev/tmuxline.vim'
            Bundle 'regedarek/ZoomWin'
            Bundle 'Yggdroot/indentLine'
        "}}}
        " Navigatoin {{{
            Bundle 'kien/ctrlp.vim'
            Bundle 'mileszs/ack.vim'
        "}}}
        " Config / Linting {{{
            Bundle 'editorconfig/editorconfig-vim'
            Bundle 'scrooloose/syntastic'
        "}}}
        " Snippets {{{
            Bundle 'mattn/emmet-vim'
            Bundle 'MarcWeber/vim-addon-mw-utils'
            Bundle 'tomtom/tlib_vim'
            Bundle 'garbas/vim-snipmate'
            Bundle 'ervandew/supertab'
            Bundle 'vxsx/vim-snippets'
        "}}}
        " JS {{{
            Bundle 'marijnh/tern_for_vim'
            Bundle 'moll/vim-node'
        "}}}
        " Editing / Formatting {{{
            Bundle 'pix/vim-align'
            Bundle 'tomtom/tcomment_vim'
            Bundle 'michaeljsmith/vim-indent-object'
            Bundle 'tpope/vim-unimpaired'
            Bundle 'gregsexton/MatchTag'
            Bundle 'vim-scripts/matchit.zip'
            Bundle 'lukaszb/vim-web-indent'
            Bundle 'wellle/targets.vim'
            Bundle 'tommcdo/vim-exchange'
            Bundle 'AndrewRadev/splitjoin.vim'
            Bundle 'terryma/vim-expand-region'
            Bundle 'vim-scripts/TaskList.vim'
            Bundle 'sjl/gundo.vim'
        "}}}
    "}}}

    filetype plugin indent on     " required
"}}}
" Basic rules {{{
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
    " annoying window
    map q: :q
"}}}
" Appearance {{{
set ruler
    syntax on
    set synmaxcol=500 " Syntax coloring lines that are too long just slows down the world
    set cursorline

    set visualbell
    set scrolloff=3
    set showcmd

    set rnu

    " Status bar {{{
        set laststatus=2
    "}}}
    " Colorscheme {{{
        try
        " Solarized {{{
            let g:solarized_visibility='low'
            let g:solarized_contrast='normal'
            let g:solarized_diffmode='high'
            let g:solarized_termtrans=1
            set background=light
            color solarized
        "}}}
        " Gruvbox {{{
            " let g:gruvbox_contrast_dark = 'soft'
            " let g:gruvbox_invert_selection = 0
            " let g:gruvbox_italic = 1
            " set background=dark
            " color gruvbox
        "}}}
        " Hybrid {{{
            " set background=dark
            " let g:hybrid_custom_term_colors = 1
            " color hybrid
        "}}}
        " Gotham {{{
            " color gotham
        "}}}
        catch /:E185:/
            " silently fail if no colorscheme found
        endtry
    "}}}

"}}}
" Encoding {{{
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
" FileFormat {{{
    menu FileFormat.UNIX         :e ++ff=unix<CR>
    menu FileFormat.DOS          :e ++ff=dos<CR>
    menu FileFormat.Mac          :e ++ff=mac<CR>

    map <S-F2> :emenu FileFormat.
"}}}
" Whitespace and indentation {{{
    set nowrap

    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab

    " Round indent to multiple of 'shiftwidth'.
    " Indentation always be multiple of shiftwidth
    " Applies to  < and > command
    set shiftround

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

    " CSScomb
    function! CSScomb()
        execute "silent !csscomb " . expand('%')
        redraw!
    endfunction
"}}}
" Searching and Replacing {{{
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
" Tab completion {{{
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*/build/*,*/dist/*,*/node_modules/*,*/coverage/*
"}}}
" Window manipulation {{{
    set splitbelow
    set splitright

    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l

    " Window resizing mappings {{{
        nmap <Up>    5<C-w>+
        nmap <Down>  5<C-w>-
        nmap <Left>  5<C-w><
        nmap <Right> 5<C-w>>
    "}}}
    " Tabs mappings {{{
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
" Folding {{{
    set foldenable                " Turn on folding
    set foldmethod=manual
    "set foldlevel=100             " Don't autofold anything (but I can still fold manually)

    set foldopen=block,hor,tag    " what movements open folds
    set foldopen+=percent,mark
    set foldopen+=quickfix,search
"}}}
" Files manipulation {{{
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

    " Create parent directory on save if does not exist
    augroup BWCCreateDir
        au!
        autocmd BufWritePre,BufNewFile * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
    augroup END

    " save file with root permissions
    cmap w!! %!sudo tee > /dev/null %

    " map command wq wa qa in russian
    cmap ц w
    cmap ф a
    cmap й q

    " Editing files {{{
        nnoremap K <nop>
        nnoremap K i<CR><ESC>

        set pastetoggle=<F10>

        " html escape/unescape
        " via: http://vim.wikia.com/wiki/HTML_entities
        function! HtmlEscape()
          silent s/&/\&amp;/eg
          silent s/</\&lt;/eg
          silent s/>/\&gt;/eg
        endfunction

        function! HtmlUnEscape()
          silent s/&lt;/</eg
          silent s/&gt;/>/eg
          silent s/&amp;/\&/eg
        endfunction

        map <silent> <Leader>he :call HtmlEscape()<CR>
        map <silent> <Leader>hu :call HtmlUnEscape()<CR>
    "}}}
    " Moving in file {{{
        " imap <C-h> <C-o>h
        " imap <C-j> <C-o>j
        " imap <C-k> <C-o>k
        " imap <C-l> <C-o>l

        nmap <tab> %
        vmap <tab> %

        " this is for learning hjkl moving
        inoremap <up>    <nop>
        inoremap <down>  <nop>
        inoremap <left>  <nop>
        inoremap <right> <nop>

        " Move in insert mode like in command line
        imap <C-e> <C-o>A
        imap <C-a> <C-o>I
    "}}}
    " File formatting {{{
        set fo-=o  " Do not insert the current comment leader after hitting 'o' or 'O' in Normal mode.
        set fo+=r  " Automatically insert a comment leader after an enter
    "}}}
    " Remember last location in file {{{
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
    endif
    "}}}
    " Helper functions {{{
    fun! DetectDjangoTemplate()
        let n = 1
        while n < line("$")
            if getline(n) =~ '{%' || getline(n) =~ '{{'
                set ft=htmldjango
                return
            endif
            let n = n + 1
        endwhile
        set ft=html "default html
    endfun

    fun! DetectMinifiedJavaScriptFile()
        let n = 1
        while n < line("$")
            if len(getline(n)) >= 500
                " set syntastic to off
                let b:syntastic_mode = 'passive'
                return
            endif
            let n = n + 1
        endwhile
    endfun

    " Somewhat hackish way to enable vim-jsx
    " If i don't do that - it will set ft=javascript.jsx on
    " every javascript file, which in turn makes Tcomment to
    " always use {/* comments like this */} which makes me sad.
    fun! DetectJSX()
        let n = 1
        let b:jsx_pragma_found = 0
        while n < line("$")
            if getline(n) =~ 'React' || getline(n) =~ 'react'
                " set syntax to jsx
                let b:jsx_pragma_found = 1
                return
            endif
            let n = n + 1
        endwhile
    endfun
    "}}}
"}}}
" Filetype autocommands {{{
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
        au BufNewFile,BufRead *.lancet set ft=dosini
        " That's so i have my css snippets in scss files
        au BufNewFile,BufRead *.scss set ft=scss.css
        au FileType scss,css nnoremap <buffer> <F5> :call CSScomb()<CR>
        " Reload snippets when editing snippets file
        au! BufWritePost *.snippet call ReloadAllSnippets()
        " au! BufNewFile,BufRead *.html call DetectDjangoTemplate()
        au! FileType javascript call DetectMinifiedJavaScriptFile()
        au! BufRead,BufNewFile *.js call DetectMinifiedJavaScriptFile()
        au! FileType javascript call DetectJSX()
        au! BufRead,BufNewFile *.json set ft=json
        au! bufwritepost vimrc nested source $MYVIMRC

        au BufRead,BufWinEnter,WinEnter,FocusGained * checktime

    endif

    " Automatically reload file if it was changed on disc
    " and was saved already in the editor
    set autoread
"}}}
" Directories for swp files {{{
    set backupdir=~/.vim/backup
    set noswapfile
    set undofile
    set undodir=~/.vim/backup
"}}}
" Cyrillic keys mappings {{{
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
" Include user's local vim config {{{
    if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
    endif
"}}}
" Plugins {{{

    " Unimpaired {{{
        " Bubble single lines
        nmap <D-k> [e
        nmap <D-j> ]e
        " Bubble multiple lines
        vmap <D-k> [egv
        vmap <D-j> ]egv
    "}}}
    " SnipMate {{{
        let g:snippets_dir = '~/.vim/bundle/vim-snippets/snippets'
    "}}}
    " TComment {{{
        map <silent> // :TComment<CR>
    "}}}
    " NERDTree {{{
        let NERDTreeIgnore=['\.rbc$', '\~$']
        map <Leader>n :NERDTreeToggle<CR>
        let NERDTreeChDirMode=0
        "let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        "let NERDTreeKeepTreeInNewTab=1
        "let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
    "}}}
    " ZoomWin configuration {{{
        map <Leader><Leader> :ZoomWin<CR>
    "}}}
    " Fugitive {{{
        autocmd User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<CR> |
          \ endif
        autocmd BufReadPost fugitive://* set bufhidden=delete
    "}}}
    " Gundo {{{
        nnoremap <Leader>gu :GundoToggle<CR>
    "}}}
    " Syntastic {{{
        " not yet implemented correctly
        let s:defaultNodeModules = '~/.vim/node_modules/.bin/'

        function! s:FindSyntasticExecPath(toolName)
            let fullPath=fnamemodify('.', ':p:h')
            while fullPath != fnamemodify('/', ':p:h')
                if filereadable(expand(fullPath . '/node_modules/.bin/' . a:toolName, 1))
                    return fullPath . '/node_modules/.bin/' . a:toolName
                endif
                if filereadable(expand(fullPath . '/node_modules/gulp-' .  a:toolName . '/node_modules/.bin/' . a:toolName, 1))
                    return fullPath . '/node_modules/gulp-' .  a:toolName . '/node_modules/.bin/' . a:toolName
                endif
                let fullPath = fnamemodify(fullPath . '/../', ':p:h')
            endwhile

            if executable(a:toolName)
                return a:toolName
            endif

            return  s:defaultNodeModules . a:toolName
        endfunction

        " setting up jshint and jscs if available
        let g:syntastic_javascript_jshint_exec = s:FindSyntasticExecPath('jshint')
        let g:syntastic_javascript_jscs_exec = s:FindSyntasticExecPath('jscs')
        let g:syntastic_javascript_eslint_exec = s:FindSyntasticExecPath('eslint')

        let g:syntastic_check_on_open=1
        let g:syntastic_enable_signs=0
        let g:syntastic_enable_balloons = 0
        let g:syntastic_mode_map = { 'mode': 'passive',
                                   \ 'active_filetypes': ['javascript', 'json', 'python'],
                                   \ 'passive_filetypes': [] }
        if $VIM_JS_LINT == 'jshint'
            let g:syntastic_javascript_checkers = ['jshint', 'jscs']
        else
            let g:syntastic_javascript_checkers = ['eslint']
        endif
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_javascript_jscs_args = "--esnext"
        " let g:syntastic_html_checkers = ['validator']
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_aggregate_errors=1

        command! ESLINT call ESlintSupport()
        command! JSHINT call JSHintSupport()

        function! ESlintSupport()
            let g:syntastic_javascript_checkers = ['eslint']
            execute 'SyntasticCheck'
        endfunction

        function! JSHintSupport()
            let g:syntastic_javascript_checkers = ['jshint', 'jscs']
            execute 'SyntasticCheck'
        endfunction
    "}}}
    " Vim-JSX {{{
        let g:jsx_ext_required = 0
        " Works combined with DetectJSX()
        let g:jsx_pragma_required = 1
    "}}}
    " IndentLine {{{
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
    " Emmet {{{
        let g:user_emmet_leader_key='<C-e>'
    "}}}
    " JS DOC {{{
        let g:jsdoc_default_mapping = 0
        let g:jsdoc_return = 0
        let g:jsdoc_underscore_private = 1
        let g:jsdoc_access_descriptions = 2
        nmap <silent> <Leader>js :JsDoc<CR>
    "}}}
    " CtrlP {{{
        let g:ctrlp_extensions = ['buffertag']
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](.git|.hg|.svn|.egg_link|.egg-info|.*migrations|env|cms-test-env)$',
          \ 'file': '\v\.(exe|so|dll)$',
          \ 'link': 'some_bad_symbolic_links',
          \ }
    "}}}
    " Require navigator {{{
        nnoremap <Leader>gf :call Navigate()<cr>
        nnoremap <Leader>gb :call Back()<cr>
    "}}}
    " Dpaster {{{
        vmap <Leader>dp :w !dpaster -t 
        vmap <silent> <Leader>cp :w !pbcopy<CR><CR>
    "}}}
    " Supertab {{{
        let g:SuperTabDefaultCompletionType = "context"
        set completeopt-=preview
    "}}}
    " Airline {{{
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#bufferline#enabled = 0
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#syntastic#enabled = 1
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline#extensions#csv#enabled = 0
        let g:airline#extensions#hunks#non_zero_only = 1
        let g:airline#extensions#virtualenv#enabled = 0
        let g:airline#extensions#eclim#enabled = 0
        let g:airline#extensions#tabline#enabled = 0
        let g:airline#extensions#tmuxline#enabled = 1
        let g:airline#extensions#nrrwrgn#enabled = 0
    "}}}
    " Gitgutter {{{
        let g:gitgutter_map_keys = 0
        let g:gitgutter_signs = 0
        let g:gitgutter_max_signs = 10000
        let g:gitgutter_highlight_lines = 0
    "}}}
    " Tern {{{
        let g:tern_show_signature_in_pum = 1
    "}}}
    " Toggle Cursor {{{
        " upon hitting escape to change modes,
        " send successive move-left and move-right
        " commands to immediately redraw the cursor
        " inoremap <special> <Esc> <Esc>hl
        set ttimeoutlen=50

        " don't blink the cursor
        set guicursor+=i:blinkwait0
    "}}}
    " Ack {{{
        let g:ackprg = 'ag --nogroup --nocolor --column'
    "}}}
" }}}
" Disabled options {{{
    " Setting this below makes it sow that error messages don't disappear after one second on startup.
    "set debug=msg


    " The following beast is something i didn't write... it will return the 
    " syntax highlighting group that the current "thing" under the cursor
    " belongs to -- very useful for figuring out what to change as far as 
    " syntax highlighting goes.
    " nmap <silent> <Leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"}}}

" vim:foldmethod=marker:foldlevel=0
