" Plugin initialization {{{
    set nocompatible
    filetype off
    " Initialize vim-plug
    call plug#begin('~/.vim/bundle')

    " Plugins {{{
        " Colorschemes {{{
            Plug 'vxsx/vim-solarized8'
            Plug 'arcticicestudio/nord-vim'
            Plug 'ishan9299/nvim-solarized-lua'
            Plug 'sainnhe/everforest'
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
            " Plug 'othree/html5.vim', { 'for': ['html'] }
            " Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
            Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
            Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
            " Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript'] }
            " Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
            " Plug 'elzr/vim-json', { 'for': ['json'] }
            Plug 'leafgarland/typescript-vim'
            Plug 'ianks/vim-tsx'

            " Plug 'neoclide/coc.nvim', {'branch': 'release' }
            " Plug 'nikvdp/ejs-syntax'
            Plug 'jxnblk/vim-mdx-js'

            Plug 'evanleck/vim-svelte', {'branch': 'main'}
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
            Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
            Plug 'williamboman/nvim-lsp-installer'
            Plug 'hrsh7th/cmp-nvim-lsp'
            Plug 'hrsh7th/cmp-buffer'
            Plug 'hrsh7th/cmp-path'
            Plug 'hrsh7th/cmp-cmdline'
            Plug 'hrsh7th/cmp-nvim-lua' " -- nvim config completions
            Plug 'hrsh7th/cmp-nvim-lsp' ", -- lsp completions
            Plug 'saadparwaiz1/cmp_luasnip' " -- snippets completions
            Plug 'hrsh7th/nvim-cmp' 
            Plug 'L3MON4D3/LuaSnip'
            Plug 'norcalli/nvim-colorizer.lua'

            Plug 'nvim-lua/plenary.nvim' " -- dependency
            Plug 'windwp/nvim-spectre' " -- find and replace

            Plug 'jose-elias-alvarez/null-ls.nvim' " -- prettier, among other things
            Plug 'MunifTanjim/prettier.nvim'

            Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " -- syntax highlighting
            Plug 'nvim-treesitter/playground'

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

    set completeopt-=preview

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
            set background=light
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
    " set wildmode=full
    set nowildmenu
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
    " nmap <silent> <Leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    nmap <silent> <Leader>qq :TSHighlightCapturesUnderCursor<CR>
"}}}

lua <<EOF
    require('dark_notify').run()
EOF

" hi Pmenu ctermfg=242 ctermbg=254 guifg=#586e75 guibg=#eee8d5 guisp=NONE cterm=NONE gui=NONE
" if exists("g:colors_name") && g:colors_name == 'solarized8'
"     if &background is# "dark"
"         hi Pmenu ctermfg=242 ctermbg=254 guifg=#586e75 guibg=#003741 guisp=NONE cterm=NONE gui=NONE
"     else
"         hi Pmenu ctermfg=242 ctermbg=254 guifg=#586e75 guibg=#F3EBD9 guisp=NONE cterm=NONE gui=NONE
"     endif
" endif
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

lua << EOF
-- barely useful
require'colorizer'.setup({
  'scss';
  'typescript';
   'lua';
})
EOF

lua << EOF
local keymap = vim.keymap.set
local saga = require('lspsaga')

vim.wo.number = true -- this is set number, but lspsaga wouldn't get it unless set through this

saga.init_lsp_saga({
    code_action_lightbulb = { enable = false }
})

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

EOF

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require("luasnip")

  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local check_backspace = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
        -- native_menu = false,
        -- ghost_text = true,
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
      -- ['<Tab>'] = function(fallback)
      -- if not cmp.select_next_item() then
      --   if vim.bo.buftype ~= 'prompt' and has_words_before() then
      --     cmp.complete()
      --   else
      --     fallback()
      --   end
      -- end
    ['<Tab>'] = function(fallback)
        if luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        elseif not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end
    end,
      --   ['<S-Tab>'] = function(fallback)
      --   if vim.fn.pumvisible() == 1 then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      --   elseif luasnip.jumpable(-1) then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      --   else
      --     fallback()
      --   end
      -- end,
    
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
      { name = 'luasnip' },
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
  -- cmp.setup.cmdline('/', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })

  -- cmp.setup.cmdline(':Ack', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })

  -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(':', {
  --   mapping = cmp.mapping.preset.cmdline(),
  -- })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = function(client) 
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    end
  }
  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities
  }
EOF

lua << EOF
    local null_ls = require("null-ls")
    null_ls.setup({
        on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
                vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

                -- format on save
                vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
            end

            if client.server_capabilities.documentRangeFormattingProvider then
                vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
            end
        end,
        -- sources = { 
        --     null_ls.builtins.formatting.prettierd.with  {
        --         filetypes = { "json", "svelte", "markdown", "css", "typescript", "typescriptreact", "javascript", "javascriptreact" },
        --     }, 
        -- },
        -- on_attach = function(client, bufnr) 
        --     if client.supports_method("textDocument/formatting") then
        --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --             group = augroup,
        --             buffer = bufnr,
        --             callback = function()
        --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        --                 vim.lsp.buf.formatting_sync()
        --             end,
        --         })
        --     end
        -- end,
        debug = true,
    })
EOF

lua << EOF
local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "svelte",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "typescript", "svelte", "scss", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension, which is the case for now, otherwise the colorscheme becomes way too bright
    -- and "i hate change"
    enable = false,
    use_languagetree = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
   playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
};
EOF

lua << EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = false,
    show_current_context_start = false,
    use_treesitter = true,
    show_first_indent_level = false,
}
EOF

nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

lua << EOF
require('spectre').setup({
    find_engine = {
    ['ag'] = {
      cmd = "ag",
      args = {
        '--vimgrep',
        '-s'
      } ,
      options = {
        ['ignore-case'] = {
          value= "-i",
          icon="[I]",
          desc="ignore case"
        },
        ['hidden'] = {
          value="--hidden",
          desc="hidden file",
          icon="[H]"
        },
      },
    },
},
 default = {
      find = {
          --pick one of item in find_engine
          cmd = "ag",
          options = {"ignore-case"}
      },
  },
})
EOF

" vim:foldmethod=marker:foldlevel=0
