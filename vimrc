" Plugin initialization {{{
    set nocompatible
    filetype off
    " Initialize vim-plug
    call plug#begin('~/.vim/bundle')

    " Plugins {{{
        " Colorschemes {{{
            " Plug 'EdenEast/nightfox.nvim'
            Plug 'vxsx/vim-solarized8'
            Plug 'f-person/auto-dark-mode.nvim'
        "}}}
        " UI {{{
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'
            Plug 'edkolev/tmuxline.vim'
            Plug 'regedarek/ZoomWin'
            Plug 'lukas-reineke/indent-blankline.nvim'
            Plug 'cormacrelf/dark-notify'
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'nvim-tree/nvim-web-devicons'

        "}}}
        " Syntax {{{
            Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
            Plug 'hail2u/vim-css3-syntax', { 'for': ['scss'] }
            Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
            Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
            Plug 'leafgarland/typescript-vim'
            Plug 'ianks/vim-tsx'
            Plug 'jxnblk/vim-mdx-js'
            Plug 'evanleck/vim-svelte', {'branch': 'main'}
            Plug 'prisma/vim-prisma'
        "}}}
        " Git {{{
            Plug 'tpope/vim-fugitive', { 'on': 'Git' }
        "}}}
        " Config / Linting {{{
            Plug 'editorconfig/editorconfig-vim'
        "}}}
        " Navigation {{{
            Plug 'ctrlpvim/ctrlp.vim'
            Plug 'mileszs/ack.vim', { 'on': 'Ack' }
        "}}}
        " Snippets {{{
            Plug 'MarcWeber/vim-addon-mw-utils'
            Plug 'tomtom/tlib_vim'
            Plug 'vxsx/vim-snippets'
        "}}}
        " Editing / Formatting {{{
            Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }
            Plug 'michaeljsmith/vim-indent-object'
            Plug 'Valloric/MatchTagAlways'
            Plug 'chrisbra/matchit'
            Plug 'wellle/targets.vim'
            Plug 'sjl/gundo.vim'
        "}}}
        " Experimental {{{
            Plug 'neovim/nvim-lspconfig'
            Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
            Plug 'williamboman/mason.nvim'
            Plug 'williamboman/mason-lspconfig.nvim'
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

            Plug 'stevearc/conform.nvim'

            Plug 'github/copilot.vim'

            Plug 'MunifTanjim/nui.nvim'
            " Plug 'Bryley/neoai.nvim'

            " Plug 'folke/trouble.nvim'

            Plug 'themaxmarchuk/tailwindcss-colors.nvim'
            Plug 'rachartier/tiny-inline-diagnostic.nvim'
        "}}}
        " AI {{{

            Plug 'folke/snacks.nvim'
            " Plug 'NickvanDyke/opencode.nvim'
            " Plug 'coder/claudecode.nvim'

            " Plug 'nvim-treesitter/nvim-treesitter'
            " Plug 'stevearc/dressing.nvim'
            " Plug 'nvim-lua/plenary.nvim'
            " Plug 'MunifTanjim/nui.nvim'
            " Plug 'MeanderingProgrammer/render-markdown.nvim'

            " Optional deps
            " Plug 'hrsh7th/nvim-cmp'
            " Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
            " Plug 'HakonHarnes/img-clip.nvim'
            " Plug 'zbirenbaum/copilot.lua'

            " Yay, pass source=true if you want to build from source
            " Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
        " }}}
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

    " yank into system clipboard by default
    set clipboard+=unnamed

    if $TMUX == ''
    else
        " tmux and truecolor aren't ok
        " this handles the full length lines
        set t_ut=
    endif

    " make it easy
    nmap <Space> :
    nmap Y yy
    " annoying window i never use
    map q: :q
"}}}
" Appearance {{{
    syntax on
    set synmaxcol=300 " Syntax coloring lines that are too long just slows down the world
    set cursorline
    set signcolumn=no

    set visualbell
    set scrolloff=3
    set showcmd

    set completeopt-=preview

    set nu

    set numberwidth=5

    " Status bar {{{
        set laststatus=2
    "}}}
    " Colorscheme {{{
        set termguicolors
        try
        " Solarized {{{
            " color nightfox
            let g:solarized_visibility='low'
            let g:solarized_diffmode='high'
            let g:solarized_term_italics=1
            set background=light
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
    set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*/.git/*,*/build/*,*/dist/*,*/node_modules/*,*/coverage/*,*.egg-info,*.egg_link,*/south_migrations/*,*/django_migrations/*,data/media/filer_public/*
"}}}
" Window manipulation {{{
    set splitbelow
    set splitright

    " tmux naviagator used instead
    " nmap <C-h> <C-w>h
    " nmap <C-j> <C-w>j
    " nmap <C-k> <C-w>k
    " nmap <C-l> <C-w>l

    nmap <Up>    5<C-w>+
    nmap <Down>  5<C-w>-
    nmap <Left>  5<C-w><
    nmap <Right> 5<C-w>>
    " Tabs mappings {{{
        nnoremap <Leader>[ gT
        nnoremap <Leader>] gt
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

    " Editing files {{{
        " split line
        nnoremap K <nop>
        nnoremap K i<CR><ESC>
        " Move the current line up
        nnoremap [e :silent! move .-2<CR>
        " Move the current line down
        nnoremap ]e :silent! move .+1<CR>

        " Add an empty line above the current line silently
        nnoremap [<Space> :silent! put!=repeat([''], v:count1)<CR>

        " Add an empty line below the current line silently
        nnoremap ]<Space> :silent! put =repeat([''], v:count1)<CR>
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
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
    "}}}
"}}}
" Filetype autocommands {{{
    " make uses real tabs
    au! FileType make setlocal noexpandtab
    au BufRead,BufNewFile *.yml  set tabstop=2
    au BufNewFile,BufRead *.lancet set ft=dosini
    au BufNewFile,BufRead .babelrc set ft=javascript
    au BufRead .prettierrc set ft=json
    " Reload snippets when editing snippets file
    au! BufWritePost *.snippet call ReloadAllSnippets()
    au! BufRead,BufNewFile *.json set ft=json

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
    " TComment {{{
        map <silent> // :TComment<CR>
    "}}}
    " ZoomWin configuration {{{
        map <Leader><Leader> :ZoomWin<CR>
        if has('nvim')
            " removed 'key', 'oft', 'sn', 'tx' options which do not work with nvim
            let g:zoomwin_localoptlist = ["ai","ar","bh","bin","bl","bomb","bt","cfu","ci","cin","cink","cino","cinw","cms","com","cpt","diff","efm", "eol","ep","et","fenc","fex","ff","flp","fo","ft","gp","imi","ims","inde","inex","indk","inf","isk","kmp","lisp", "mps","ml","ma","mod","nf","ofu","pi","qe","ro","sw","si","sts","spc","spf","spl","sua","swf","smc","syn","ts","tw","udf","wfh","wfw","wm"]
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
    " JSON {{{
        let g:vim_json_syntax_conceal = 0
    "}}}
    " Vim Javascript {{{
        let g:javascript_plugin_jsdoc = 1
    "}}}
    " CtrlP {{{
        " if file is already open, do not switch to it
        let g:ctrlp_switch_buffer = 'et'
        if executable("ag")
            let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g "" --ignore-dir=.git'
        endif

        nnoremap <silent> <C-p> :CtrlP<CR>
    "}}}
    " Copy / paste {{{
        vmap <silent> <Leader>cp "+y
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
    " Toggle Cursor {{{
        if has('nvim')
            set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
        endif
    "}}}
    " Ack {{{
        let g:ackprg = 'ag --nogroup --hidden --nocolor --column'
    "}}}
    " Typescript {{{
        autocmd FileType typescript setlocal completeopt+=menu,preview
    "}}}
    " Copilot "{{{
        imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
        highlight CopilotSuggestion guifg=#95A0A1 ctermfg=8
    "}}}
    " MatchTagAlways "{{{
        let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \}
    "}}}
    " Trouble "{{{
        autocmd FileType typescript,typescriptreact compiler tsc | setlocal makeprg=npx\ tsc
    "}}}
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

" make it green instead of bold red
hi typescriptReserved guifg=#859900	guibg=NONE guisp=NONE cterm=NONE gui=NONE
" fix typescript syntax in nvim@0.5.0
" hi link typescriptReserved Keyword
hi link typescriptParens Operator
hi link typescriptNull Type
hi link CocFadeOut SpellBad


" TODO move to trouble.lua
hi TroubleFsBasename guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleFsCount guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleFsFilename guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleFsSource guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconArray guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconBoolean guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconClass guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconConstant guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconConstructor guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconFunction guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconNamespace guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconNull guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconNumber guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconObject guifg=NONE guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIconOperator guifg=#B968FC guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIndentFoldClosed guifg=#B968FC guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIndentFoldOpen guifg=#B968FC guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIndentLast guifg=#B968FC guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIndentMiddle guifg=#B968FC guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIndentTop guifg=#B968FC guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleIndentWs guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleNormal guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroubleNormalNC guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroublePos guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE
hi TroublePreview guifg=#E1D6F8 guibg=none guisp=NONE blend=NONE gui=NONE

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" i'm shit at typing
iabbrev funciton function
iabbrev applicaiton application
iabbrev enviroment environment
iabbrev enviromnet environment
iabbrev enviromnent environment
iabbrev environemt environment
iabbrev environemnt environment
iabbrev environemnt environment
iabbrev ligth light
iabbrev rigth right

lua << EOF
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.vim/?.lua;" .. package.path

require('lua/init')
EOF
