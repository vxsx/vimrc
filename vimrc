" Plugin initialization {{{
    set nocompatible
    filetype off
    " Initialize vim-plug
    call plug#begin('~/.vim/bundle')

    " Plugins {{{
        " Colorschemes {{{
            Plug 'vxsx/vim-solarized8'
        "}}}
        " UI {{{
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'

            Plug 'edkolev/tmuxline.vim'
            Plug 'regedarek/ZoomWin'
            Plug 'lukas-reineke/indent-blankline.nvim'
            Plug 'cormacrelf/dark-notify'
        "}}}
        " Syntax {{{
            Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
            Plug 'hail2u/vim-css3-syntax', { 'for': ['scss'] }
            Plug 'othree/html5.vim', { 'for': ['html'] }
            Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
            Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
            Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
            Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript'] }
            Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
            Plug 'elzr/vim-json', { 'for': ['json'] }
            Plug 'leafgarland/typescript-vim'
            Plug 'ianks/vim-tsx'
            " Plug 'neoclide/coc.nvim', {'branch': 'release' }
            Plug 'nikvdp/ejs-syntax'
            Plug 'jxnblk/vim-mdx-js'
        "}}}
        " Git {{{
            Plug 'tpope/vim-git'
            Plug 'tpope/vim-fugitive', { 'on': 'Git' }
        "}}}
        " Config / Linting {{{
            Plug 'editorconfig/editorconfig-vim'
            Plug 'dense-analysis/ale'
        "}}}
        " Navigation {{{
            Plug 'ctrlpvim/ctrlp.vim'
            Plug 'mileszs/ack.vim', { 'on': 'Ack' }
        "}}}
        " Snippets {{{
            Plug 'MarcWeber/vim-addon-mw-utils'
            Plug 'tomtom/tlib_vim'
            " Plug 'garbas/vim-snipmate'
            " Plug 'ervandew/supertab'
            Plug 'vxsx/vim-snippets'
        "}}}
        " Editing / Formatting {{{
            Plug 'junegunn/vim-easy-align'
            Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }
            Plug 'michaeljsmith/vim-indent-object'
            Plug 'tpope/vim-unimpaired'
            Plug 'Valloric/MatchTagAlways'
            Plug 'chrisbra/matchit'
            Plug 'lukaszb/vim-web-indent'
            Plug 'wellle/targets.vim'
            Plug 'sjl/gundo.vim'
            Plug 'AndrewRadev/splitjoin.vim'
        "}}}
        " Experimental {{{
            Plug 'neovim/nvim-lspconfig'
            Plug 'williamboman/nvim-lsp-installer'
            Plug 'hrsh7th/cmp-nvim-lsp'
            Plug 'hrsh7th/cmp-buffer'
            Plug 'hrsh7th/cmp-path'
            Plug 'hrsh7th/cmp-cmdline'
            Plug 'hrsh7th/nvim-cmp' 
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
    " if has("mouse_sgr")
    "     set ttymouse=sgr
    " else
    "     set ttymouse=xterm2
    " end
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
    nmap Y yy
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
            let g:solarized_diffmode='high'
            let g:solarized_term_italics=1
            set background=dark
            set termguicolors
            color solarized8
        "}}}
        catch /:E185:/
            " silently fail if no colorscheme found
        endtry
    "}}}

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
        set listchars=tab:\ \ ,trail:·,extends:→,nbsp:×
    endif
    if has("linebreak")
        let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
    endif

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start

    " load the plugin and indent settings for the detected filetype
    filetype plugin indent on

    " indent
    vnoremap < <gv
    vnoremap > >gv

    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"}}}
" Searching and Replacing {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " mapping to disable search highlight
    nmap <silent> <Leader><Space> :noh<CR>

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
    set foldopen=block,hor,tag    " what movements open folds
    set foldopen+=percent,mark
    set foldopen+=quickfix,search
"}}}
" Files manipulation {{{
    nnoremap <leader>w   <C-w>v
    nnoremap <leader>we  <C-w>v:e <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>se  <C-w>s:e <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>ve  <C-w>v:e ~/.vim/vimrc<CR>

    " Opens an edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>e
    map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

    " Opens a tab edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>t
    map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

    " Inserts the path of the currently edited file into a command
    " Command mode: Ctrl+P
    cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

    " Create parent directory on save if does not exist
    augroup BWCCreateDir
        au!
        autocmd BufNewFile * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
    augroup END

    " save file with root permissions
    cmap w!! %!sudo tee > /dev/null %

    " map command wq wa qa in russian
    cmap ц w
    cmap ф a
    cmap й q

    " Editing files {{{
        " split line
        nnoremap K <nop>
        nnoremap K i<CR><ESC>

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
        nmap <tab> %
        vmap <tab> %
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
        au BufRead,BufNewFile *.yml  set tabstop=2
        au BufNewFile,BufRead *.tt set ft=html.css matchpairs-=<:>
        au BufNewFile,BufRead *.flavour set ft=yaml.flavour
        au BufNewFile,BufRead *.lancet set ft=dosini
        au BufNewFile,BufRead .babelrc set ft=javascript
        " That's so i have my css snippets in scss files
        au BufNewFile,BufRead *.scss set ft=scss.css
        " Reload snippets when editing snippets file
        au! BufWritePost *.snippet call ReloadAllSnippets()
        au BufRead,BufNewFile *.js call DetectMinifiedJavaScriptFile()
        au! FileType javascript call DetectJSX()
        au! BufRead,BufNewFile *.json set ft=json
        au! bufwritepost vimrc nested source $MYVIMRC
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
    set nobackup
    set nowritebackup
"}}}
" Include user's local vim config {{{
    if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
    endif
"}}}
" Plugins {{{

    " SnipMate {{{
        " let g:snippets_dir = '~/.vim/bundle/vim-snippets/snippets'
        " let g:snipMate = { 'snippet_version' : 0 }
    "}}}
    " TComment {{{
        map <silent> // :TComment<CR>
    "}}}
    " ZoomWin configuration {{{
        map <Leader><Leader> :ZoomWin<CR>
        if has('nvim')
            " removed 'key', 'oft', 'sn', 'tx' options which do not work with nvim
            let g:zoomwin_localoptlist = ["ai","ar","bh","bin","bl","bomb","bt","cfu","ci","cin","cink","cino","cinw","cms","com","cpt","diff","efm","eol","ep","et","fenc","fex","ff","flp","fo","ft","gp","imi","ims","inde","inex","indk","inf","isk","kmp","lisp","mps","ml","ma","mod","nf","ofu","pi","qe","ro","sw","si","sts","spc","spf","spl","sua","swf","smc","syn","ts","tw","udf","wfh","wfw","wm"]
        endif
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
        let g:gundo_prefer_python3 = 1
    "}}}
    " Ale {{{
        let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'typescript': ['tsserver', 'eslint'],
        \   'scss': ['stylelint'],
        \}
        let g:ale_linters_explicit = 1
        let g:ale_set_signs = 0
        set signcolumn=no
    "}}}
    " JSON {{{
        let g:vim_json_syntax_conceal = 0
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
            vmap <silent> <Leader>cp "+y
        else
            vmap <silent> <Leader>cp "+y
        endif
    "}}}
    " Supertab {{{
        " let g:SuperTabDefaultCompletionType = "context"
        " let g:SuperTabContextDefaultCompletionType = "<c-n>"
        set completeopt-=preview
    "}}}
    " Airline {{{
        let g:airline_powerline_fonts = 0
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        let g:airline_symbols.colnr = ' '
        let g:airline_symbols.maxlinenr = ''
        let g:airline_symbols.linenr = ' '
        let g:airline_section_z = airline#section#create(['%p%%', 'linenr', 'maxlinenr'])

        let g:airline#extensions#bufferline#enabled = 0
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline#extensions#csv#enabled = 0
        let g:airline#extensions#hunks#non_zero_only = 1
        let g:airline#extensions#virtualenv#enabled = 0
        let g:airline#extensions#eclim#enabled = 0
        let g:airline#extensions#tabline#enabled = 0
        let g:airline#extensions#tmuxline#enabled = 1
        let g:airline#extensions#nrrwrgn#enabled = 0
        let g:airline#extensions#ale#enabled = 1
        let g:airline#extensions#coc#enabled = 0

        let g:airline_skip_empty_sections = 1
        let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

        " let g:tmuxline_powerline_separators = 0
        let g:tmuxline_separators = {
            \ 'left' : ' ',
            \ 'left_alt': '',
            \ 'right' : '',
            \ 'right_alt' : ' ',
            \ 'space' : ' ' }
    "}}}
    " Tern {{{
        let g:tern_show_signature_in_pum = 1
    "}}}
    " Toggle Cursor {{{
        if has('nvim')
            set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
        endif
    "}}}
    " Ack {{{
        let g:ackprg = 'ag --nogroup --nocolor --column'
    "}}}
    " Delimitmate {{{
        let delimitMate_matchpairs = "(:),[:],<:>"
    "}}}
    " Prettier {{{
        autocmd BufRead .prettierrc set ft=json
    "}}}
    " Flow {{{
        let g:flow#autoclose=1
    "}}}
    " Typescript {{{
        autocmd FileType typescript setlocal completeopt+=menu,preview
    "}}}
    " COC {{{
        " let g:coc_node_path = '/Users/vadim/.nvm/versions/node/v16.13.1/bin/node'
        " set updatetime=300
        "
        " command! -nargs=0 Prettier :CocCommand prettier.formatFile
        " let g:coc_filetype_map = {
        "     \ 'scss.css': 'scss',
        "     \ 'markdown.mdx': 'mdx'
        "     \ }
        "
        " " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        " " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        "
        " function! s:check_back_space() abort
        "     let col = col('.') - 1
        "     return !col || getline('.')[col - 1]  =~# '\s'
        " endfunction
        "
        " let g:coc_snippet_next = '<tab>'
        " imap <C-e> <Plug>(coc-snippets-expand)
        "
        " nnoremap <silent> gh :call <SID>show_documentation()<CR>
        " " gd - go to definition of word under cursor
        " nmap <silent> gd <Plug>(coc-definition)
        " nmap <silent> gy <Plug>(coc-type-definition)
        "
        " " gi - go to implementation
        " nmap <silent> gi <Plug>(coc-implementation)
        "
        " " gr - find references
        " nmap <silent> gr <Plug>(coc-references)
        "
        " " trigger completion on c-space
        " inoremap <silent><expr> <c-space> coc#refresh()
        "
        " " Remap for rename current word
        " nmap <F2> <Plug>(coc-rename)
        "
        "
        " function! s:show_documentation()
        "     if (index(['vim','help'], &filetype) >= 0)
        "         execute 'h '.expand('<cword>')
        "     elseif (coc#rpc#ready())
        "         call CocActionAsync('doHover')
        "     else
        "         execute '!' . &keywordprg . " " . expand('<cword>')
        "     endif
        " endfunction
        "
        " " autocmd CursorHold * silent call CocActionAsync('highlight')
        "
        " let b:coc_diagnostic_info = {'error': 1, 'warning': 1, 'info': 0, 'hint': 1}
        " let g:coc_default_semantic_highlight_groups = 0
        " command! -nargs=0 Tsc :call CocAction('runCommand', 'tsserver.watchBuild')
    "}}}
    " Echodoc "{{{
        " set cmdheight=2
        set noshowmode
    "}}}
    let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}
    " \ 'jinja.html' : 1,
" }}}
" Disabled options {{{
    " Setting this below makes it sow that error messages don't disappear after one second on startup.
    " set debug=msg


    " The following beast is something i didn't write... it will return the
    " syntax highlighting group that the current `thing` under the cursor
    " belongs to -- very useful for figuring out what to change as far as
    " syntax highlighting goes.
    nmap <silent> <Leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"}}}

:lua <<EOF
    require('dark_notify').run()
EOF

" hi Pmenu ctermfg=242 ctermbg=254 guifg=#586e75 guibg=#eee8d5 guisp=NONE cterm=NONE gui=NONE
if exists("g:colors_name") && g:colors_name == 'solarized8'
    if &background is# "dark"
        hi Pmenu ctermfg=242 ctermbg=254 guifg=#586e75 guibg=#003741 guisp=NONE cterm=NONE gui=NONE
    else
        hi Pmenu ctermfg=242 ctermbg=254 guifg=#586e75 guibg=#F3EBD9 guisp=NONE cterm=NONE gui=NONE
    endif
endif
" hi PmenuSbar ctermfg=NONE ctermbg=247 guifg=NONE guibg=#93a1a1 guisp=NONE cterm=NONE gui=NONE
" hi PmenuSel ctermfg=254 ctermbg=246 guifg=#eee8d5 guibg=#839496 guisp=NONE cterm=NONE gui=NONE
" hi PmenuThumb ctermfg=NONE ctermbg=66 guifg=NONE guibg=#657b83 guisp=NONE cterm=NONE gui=NONE

" make it green instead of bold red
hi typescriptReserved guifg=#859900	guibg=NONE guisp=NONE cterm=NONE gui=NONE
" fix typescript syntax in nvim@0.5.0
" hi link typescriptReserved Keyword
hi link typescriptParens Operator
hi link typescriptNull Type
hi link CocFadeOut SpellBad

lua << EOF
require("nvim-lsp-installer").setup {}
-- require'lspconfig'.eslint.setup{}
EOF

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end


  cmp.setup({
    -- snippet = {
    --   -- REQUIRED - you must specify a snippet engine
    --   expand = function(args)
    --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --   end,
    -- },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --    ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif vim.fn["vsnip#available"](1) == 1 then
    --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
    --   elseif has_words_before() then
    --     cmp.complete()
    --   else
    --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    --   end
    -- end, { "i", "s" }),
    --
    -- ["<S-Tab>"] = cmp.mapping(function()
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    --     feedkey("<Plug>(vsnip-jump-prev)", "")
    --   end
    -- end, { "i", "s" }),
      ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities
  }
EOF

" vim:foldmethod=marker:foldlevel=0
