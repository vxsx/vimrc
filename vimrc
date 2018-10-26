" Plugin initialization {{{
    set nocompatible
    filetype off
    " Initialize vim-plug
    call plug#begin('~/.vim/bundle')

    " Plugins {{{
        " Colorschemes {{{
            " fork of altercation/vim-colors-solarized
            " Plug 'vxsx/vim-colors-solarized'
            Plug 'lifepillar/vim-solarized8'
            Plug 'jacoborus/tender.vim'
            Plug 'tyrannicaltoucan/vim-deep-space'
            Plug 'jacoborus/tender.vim'
            Plug 'morhetz/gruvbox'
            Plug 'whatyouhide/vim-gotham'
            Plug 'w0ng/vim-hybrid'
            Plug 'ajh17/Spacegray.vim'
            Plug 'ayu-theme/ayu-vim'
        "}}}
        " UI {{{
            if has('gui_running')
            else
                Plug 'jszakmeister/vim-togglecursor'
            endif
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'

            Plug 'edkolev/tmuxline.vim'
            Plug 'regedarek/ZoomWin'
            Plug 'Yggdroot/indentLine'
        "}}}
        " Syntax {{{
            Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
            Plug 'hail2u/vim-css3-syntax', { 'for': ['scss'] }
            Plug 'othree/html5.vim', { 'for': ['html'] }
            " fork of Glench/Vim-Jinja2-Syntax
            Plug 'niftylettuce/Vim-Jinja2-Syntax', { 'for': ['jinja.html'] }
            Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
            Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
            Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
            Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript'] }
            Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
        "}}}
        " Git {{{
            Plug 'tpope/vim-git'
            Plug 'tpope/vim-fugitive'
            " Plug 'airblade/vim-gitgutter'
        "}}}
        " Config / Linting {{{
            Plug 'editorconfig/editorconfig-vim'
            " Plug 'scrooloose/syntastic'
            Plug 'w0rp/ale'
            ", { 'for': ['python', 'javascript'] }
            " ^ this doesn't work properly because of airline :(
            Plug 'sbdchd/neoformat', { 'for': ['javascript', 'css', 'scss', 'scss.css'] }
        "}}}
        " Navigation {{{
            Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
            Plug 'mileszs/ack.vim', { 'on': 'Ack' }
            " Plug 'vim-scripts/TaskList.vim'
        "}}}
        " Snippets {{{
            Plug 'mattn/emmet-vim', { 'for': ['html', 'jinja.html'] }
            Plug 'MarcWeber/vim-addon-mw-utils'
            Plug 'tomtom/tlib_vim'
            Plug 'garbas/vim-snipmate'
            Plug 'ervandew/supertab'
            Plug 'vxsx/vim-snippets'
        "}}}
        " JS {{{
            " Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
            " Plug 'moll/vim-node', { 'for': 'javascript' }
            " Plug 'flowtype/vim-flow', { 'for': 'javascript' }
            " Plug 'majutsushi/tagbar'
        "}}}
        " Editing / Formatting {{{
            " Plug 'pix/vim-align', { 'on': 'Align' }
            Plug 'junegunn/vim-easy-align'
            Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }
            Plug 'michaeljsmith/vim-indent-object'
            Plug 'tpope/vim-unimpaired'
            " Plug 'gregsexton/MatchTag', { 'for': ['html', 'jinja.html'] }
            Plug 'Valloric/MatchTagAlways'
            Plug 'vim-scripts/matchit.zip'
            " Plug 'Raimondi/delimitMate'
            Plug 'lukaszb/vim-web-indent'
            Plug 'wellle/targets.vim'
            Plug 'sjl/gundo.vim'
            Plug 'AndrewRadev/splitjoin.vim'
        "}}}
    "}}}

    call plug#end()

    filetype plugin indent on     " required
"}}}
" Basic rules {{{
    " the title of the window will be set to the value of 'titlestring'
    " (if it is not empty), or to: filename [+=-] (path) - VIM
    set title
    set nospell
    set mouse=a
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
    if $TMUX == ''
        set clipboard+=unnamed
    else
        " tmux and truecolor aren't ok
        " this handles the full length lines
        set t_ut=
        " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
        " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    endif

    " make it easy
    nmap <Space> :
    " annoying window
    map q: :q
"}}}
" Appearance {{{
set ruler
    syntax on
    set synmaxcol=300 " Syntax coloring lines that are too long just slows down the world
    set cursorline

    set visualbell
    set scrolloff=3
    set showcmd

    set nu
    let lines = str2nr(line('$'))

    set numberwidth=5

    " Status bar {{{
        set laststatus=2
    "}}}
    " Colorscheme {{{
        try
        " Solarized {{{
            let g:solarized_visibility='low'
            " let g:solarized_contrast='normal'
            let g:solarized_diffmode='high'
            " let g:solarized_termtrans=1
            let g:solarized_term_italics=1
            set background=light
            set termguicolors
            color solarized8_dark
        "}}}
        " Deep Space {{{
            " set background=dark
            " set termguicolors
            " color deep-space
        "}}}
        " Gruvbox {{{
            " let g:gruvbox_contrast_dark = 'soft'
            " let g:gruvbox_invert_selection = 0
            " let g:gruvbox_italic = 1
            " set background=dark
            " color gruvbox
        "}}}
        " Spacegray {{{
            " color spacegray
            " set background=dark
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

    " mapping to disable search highlight
    nmap <silent> <Leader><Space> :noh<CR>

    " always on center of the window
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
    set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*/build/*,*/dist/*,*/node_modules/*,*/coverage/*,*.egg-info,*.egg_link,*/south_migrations/*,*/django_migrations/*,*/env/*,*/cms-test-env/*,data/media/filer_public/*
"}}}
" Window manipulation {{{
    set splitbelow
    set splitright

    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l

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
          silent s/&/\&amp;/e
          silent s/</\&lt;/e
          silent s/>/\&gt;/e
        endfunction

        function! HtmlUnEscape()
          silent s/&lt;/</e
          silent s/&gt;/>/e
          silent s/&amp;/\&/e
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
                let b:syntastic_skip_checks = 1
                SyntasticReset
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
                " let b:jsx_pragma_found = 1
                set filetype=javascript.jsx
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
        au BufNewFile,BufRead .babelrc set ft=javascript
        " That's so i have my css snippets in scss files
        au BufNewFile,BufRead *.scss set ft=scss.css
        au FileType scss,css nnoremap <buffer> <F5> :call CSScomb()<CR>
        " Reload snippets when editing snippets file
        au! BufWritePost *.snippet call ReloadAllSnippets()
        " au! BufNewFile,BufRead *.html call DetectDjangoTemplate()
        au! FileType javascript call DetectMinifiedJavaScriptFile()
        au BufRead,BufNewFile *.js call DetectMinifiedJavaScriptFile()
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
    " Ale {{{
        let g:ale_linters = {
        \   'javascript': ['eslint'],
        \}
        let g:ale_linters_explicit = 1
        let g:ale_set_signs = 0
        
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
        let g:syntastic_javascript_stylelint_exec = s:FindSyntasticExecPath('stylelint')

        let g:syntastic_check_on_open=1
        let g:syntastic_enable_signs=0
        let g:syntastic_enable_balloons = 1
        let g:syntastic_mode_map = { 'mode': 'passive',
                                   \ 'active_filetypes': ['scss', 'javascript', 'json', 'python'],
                                   \ 'passive_filetypes': [] }
        let g:syntastic_javascript_checkers = ['eslint']

        if filereadable(g:syntastic_javascript_stylelint_exec)
            let g:syntastic_scss_checkers = ['stylelint']
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

        "disable syntastic on a per buffer basis (some work files blow it up)
        function! SyntasticDisableBuffer()
            let b:syntastic_skip_checks = 1
            SyntasticReset
            echo 'Syntastic disabled for this buffer'
        endfunction

        command! SyntasticDisableBuffer call SyntasticDisableBuffer()

    "}}}
    " Vim Javascript {{{
        let g:javascript_plugin_jsdoc = 1
    "}}}
    " Vim-JSX {{{
        let g:jsx_ext_required = 0
        " Works combined with DetectJSX()
        let g:jsx_pragma_required = 1
    "}}}
    " IndentLine {{{
        let g:indentLine_char = '│'
        let g:indentLine_noConcealCursor = 1

        try
            if !exists("g:colors_name") || g:colors_name != 'gotham'
                let g:indentLine_color_term = 7
                let g:indentLine_color_gui = '#E4E1D2'

                let g:indentLine_faster = 1

                if &background is# "dark"
                    let g:indentLine_color_term = 0
                    let g:indentLine_color_gui = '#003540'
                endif
            endif

            if exists("g:colors_name") && g:colors_name == 'gotham'
                let g:indentLine_color_term = 8
            endif
        catch /^Vim:E121/
        endtry
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
        " if file is already open, do not switch to it
        let g:ctrlp_switch_buffer = 'et'
        if executable("ag")
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        endif

        " let g:ctrlp_custom_ignore = {
        "   \ 'dir':  '\v[\/](.git|.hg|.svn|.egg_link|.egg-info|.*migrations|env|cms-test-env|filer_public)$'
        "   \ }
        nnoremap <silent> <C-p> :CtrlP<CR>
    "}}}
    " Require navigator {{{
        nnoremap <Leader>gf :call Navigate()<cr>
        nnoremap <Leader>gb :call Back()<cr>
    "}}}
    " Dpaster {{{
        " npm install -g nodepaster
        vmap <Leader>dp :w !dpaster -t<Space>

        if $TMUX == ''
            vmap <silent> <Leader>cp :w !pbcopy<CR><CR>
        else
            vmap <silent> <Leader>cp :w !reattach-to-user-namespace pbcopy<CR><CR>
        endif
    "}}}
    " Supertab {{{
        let g:SuperTabDefaultCompletionType = "context"
        set completeopt-=preview
    "}}}
    " Airline {{{
        let g:airline_powerline_fonts = 0
        let g:airline#extensions#bufferline#enabled = 0
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline#extensions#csv#enabled = 0
        let g:airline#extensions#hunks#non_zero_only = 1
        let g:airline#extensions#virtualenv#enabled = 0
        let g:airline#extensions#eclim#enabled = 0
        let g:airline#extensions#tabline#enabled = 0
        let g:airline#extensions#tmuxline#enabled = 0
        let g:airline#extensions#nrrwrgn#enabled = 0
        let g:airline#extensions#ale#enabled = 1
        let g:airline_skip_empty_sections = 1

        " let g:tmuxline_powerline_separators = 0
        let g:tmuxline_separators = {
            \ 'left' : ' ',
            \ 'left_alt': '',
            \ 'right' : '',
            \ 'right_alt' : ' ',
            \ 'space' : ' ' }
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
        set ttimeoutlen=30

        if has('gui_running')
            set guicursor+=a:blinkon0
        else
            " don't blink the cursor
            set guicursor+=i:blinkwait0
        endif
    "}}}
    " Ack {{{
        let g:ackprg = 'ag --nogroup --nocolor --column'
    "}}}
    " Expand region {{{
        vmap v <Plug>(expand_region_expand)
        vmap <C-v> <Plug>(expand_region_shrink)
    "}}}
    " Delimitmate {{{
        let delimitMate_matchpairs = "(:),[:],<:>"
    "}}}
    " EditorConfig {{{
        let g:EditorConfig_core_mode = 'python_external'
    "}}}
    " Prettier {{{
        nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>

        " let g:prettier#exec_cmd_async = 1

        " max line lengh that prettier will wrap on
        " let g:prettier#config#print_width = 120

        " number of spaces per indentation level
        " let g:prettier#config#tab_width = 4

        " use tabs over spaces
        " let g:prettier#config#use_tabs = 'false'

        " print semicolons
        " let g:prettier#config#semi = 'true'

        " single quotes over double quotes
        " let g:prettier#config#single_quote = 'true'
        "
        " print spaces between brackets
        " let g:prettier#config#bracket_spacing = 'true'
        "
        " put > on the last line instead of new line
        " let g:prettier#config#jsx_bracket_same_line = 'true'
        "
        " none|es5|all
        " let g:prettier#config#trailing_comma = 'none'
        " let g:prettier#config#trailing_comma = 'es5'
        "
        " flow|babylon|typescript|postcss
        " let g:prettier#config#parser = 'flow'
        " let g:prettier#autoformat = 0
        " autocmd BufWritePre *idexxcom/*.js Prettier
        " autocmd BufWritePre *cyberlinkch/*.js Prettier
        " autocmd BufWritePre *django-cms/*.js Prettier
        function! SetupEnvironment()
            let l:path = expand('%:p')
            if l:path =~ '/Users/divio/work/django-cms'
                if &filetype == 'javascript'
                    setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ none\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
                endif
            else
                if &filetype == 'javascript'
                    setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
                endif
                if &filetype == 'css'
                    setlocal formatprg=prettier\ --stdin\ --parser\ scss\ --double-quote\ --trailing-comma\ es5\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
                endif
                if &filetype == 'scss'
                    setlocal formatprg=prettier\ --stdin\ --parser\ scss\ --double-quote\ --trailing-comma\ es5\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
                endif
            endif
        endfunction
        autocmd! BufReadPost,BufNewFile *.js call SetupEnvironment()
        " autocmd BufWritePre */django-cms/*.js Neoformat
        autocmd BufWritePre */idexxcom/*.js Neoformat
        autocmd BufWritePre */ac-control/*.js Neoformat
        autocmd BufWritePre */ac-control/*.scss Neoformat
        autocmd BufWritePre */divio-ui/*.js Neoformat
        autocmd BufWritePre */divio-ui/*.scss Neoformat
        autocmd BufWritePre */components/*.js Neoformat
        autocmd BufWritePre */components/*.scss Neoformat
        autocmd BufWritePre */cms-prototype/*.js Neoformat
        autocmd BufWritePre */cms-prototype/*.scss Neoformat

        autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
        autocmd FileType css setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
        autocmd FileType scss setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5\ --jsx-bracket-same-line\ --tab-width\ 4\ --print-width\ 120
        let g:neoformat_try_formatprg = 1
        let g:neoformat_only_msg_on_error = 1

    "}}}
    " Flow {{{
        let g:flow#autoclose=1
    "}}}
    let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja.html' : 1,
    \}
" }}}
" Disabled options {{{
    " Setting this below makes it sow that error messages don't disappear after one second on startup.
    "set debug=msg


    " The following beast is something i didn't write... it will return the
    " syntax highlighting group that the current `thing` under the cursor
    " belongs to -- very useful for figuring out what to change as far as
    " syntax highlighting goes.
    " nmap <silent> <Leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"}}}



" vim:foldmethod=marker:foldlevel=0
