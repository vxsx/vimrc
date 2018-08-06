" General gui options "{{{
"set guioptions-=T  " disabling toolbar
set guioptions=aAc;

function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '+'
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= '['.wincount.']'
    endif
    if label != ''
        let label .= ' '
    endif

    " Append the buffer name
    return label . "%t"
endfunction

set guitablabel=%!GuiTabLabel()

"}}}
" Mac settings "{{{
if has("gui_macvim")
    " Fullscreen takes up entire screen
    set fuoptions=maxhorz,maxvert

    " Command-T for CommandT
    macmenu &File.New\ Tab key=<D-T>

    " Command-Return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

    " Command-Shift-F for Ack
    map <D-F> :Ack<space>

    " Command-/ to toggle comments
    map <silent> <D-/> :TComment<CR>

    " Open current buffer in my browser of choice
    cmap gc! ! open -a /Applications/Google\ Chrome.app %:p<cr>
    " abbrev gc :! open -a /Applications/Chromium.app %:p<cr>

    macmenu &Edit.Font.Bigger key=<nop>
    macmenu &Edit.Font.Smaller key=<nop>

    " Moving through tabs ala Textmate "{{{
        map    <D-S-]>   gt
        imap   <D-S-]>   <ESC>gt
        map    <D-S-[>   gT
        imap   <D-S-[>   <ESC>gT
        map    <D-1>     1gt
        imap   <D-1>     <ESC>1gt
        map    <D-2>     2gt
        imap   <D-2>     <ESC>2gt
        map    <D-3>     3gt
        imap   <D-3>     <ESC>3gt
        map    <D-4>     4gt
        imap   <D-4>     <ESC>4gt
        map    <D-5>     5gt
        imap   <D-5>     <ESC>5gt
        map    <D-6>     6gt
        imap   <D-6>     <ESC>6gt
        map    <D-7>     7gt
        imap   <D-7>     <ESC>7gt
        map    <D-8>     8gt
        imap   <D-8>     <ESC>8gt
        map    <D-9>     9gt
        imap   <D-9>     <ESC>9gt
        map    <D-0>     :tablast<CR>
        imap   <D-0>     <ESC>:tablast<CR>
    "}}}


endif
"}}}
" Utility functions "{{{
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction
"}}}
" Include user's local gvim config "{{{
    if filereadable(expand("~/.gvimrc.local"))
      source ~/.gvimrc.local
    endif
"}}}


" vim:foldmethod=marker:foldlevel=0
