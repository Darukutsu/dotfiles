vim.cmd([[
noremap h m
noremap j e
noremap k n
"noremap l i
nnoremap l i
noremap m h
noremap n j
noremap e k
noremap i l
noremap H M
noremap J E
noremap K N
noremap L I
noremap M H
noremap N J
noremap E K
noremap I L
" vim-wordmotion
noremap W w
xnoremap aW aw
onoremap aW aw
xnoremap iW iw
onoremap iW iw

let mapleader = " "
nnoremap <leader>; :noh<cr>
"nnoremap <leader>/ :let a = input("Enter value: ") \| lvim a % \| lopen<cr>

" Edit vimr configuration file
nnoremap confi :tabedit $MYVIMRC<cr>
nnoremap confk :tabedit $XDG_CONFIG_HOME/nvim/lua/keymap.lua<cr>
nnoremap confp :tabedit $XDG_CONFIG_HOME/nvim/lua/plugins.lua<cr>
" Reload vims configuration (current file)
nnoremap confr :so %<cr>
"nnoremap confr :source $MYVIMRC | $XDG_CONFIG_HOME/nvim/lua/keymap.lua | $XDG_CONFIG_HOME/nvim/lua/plugins.lua<cr>

" Telescope shortcut
"nnoremap <leader>t <cmd>Telescope builtin include_extensions=true<cr>
"nnoremap <leader>/ <cmd>Telescope find_files<cr>
nnoremap <leader>? :Telescope keymaps<cr>
nnoremap <leader>: :Telescope commands<cr>
nnoremap <leader><Tab> :Telescope buffers<cr>
nnoremap <leader>/ :Telescope current_buffer_fuzzy_find<cr>
"nnoremap <leader>/ :Telescope live_grep<cr>
nnoremap <leader>u :Telescope undo<cr>
nnoremap <leader>d :Telescope dap commands<cr>
"nnoremap <leader>gs <cmd>Telescope git_status<cr>


" Ccc pick
nnoremap <leader>c :CccPick<cr>

" Tokyo Theme switch
let g:isDark = 1
function! ToggleTheme(isDark)
  if g:isDark==1
    :lua vim.o.background = "light"
    let g:isDark = 0
  else
    :lua vim.o.background = "dark"
    let g:isDark = 1
  endif
endfunction
nnoremap <leader>t :call ToggleTheme(isDark)<cr>


" LSP enable(def)/disable
let g:isLSP = 1
let g:isDiag = 1
function! ToggleLsp(isLSP, isDiag)
  if g:isDiag==1
    :lua vim.diagnostic.disable()
    let g:isDiag = 0
  else
    :lua vim.diagnostic.enable()
    let g:isDiag = 1
  endif
  if g:isLSP==1
    :LspStop<cr>
    let g:isLSP = 0
    echo "LSP off"
  else
    :LspStart<cr>
    let g:isLSP = 1
    echo "LSP on"
  endif
endfunction
nnoremap <F3> :call ToggleLsp(isLSP, isDiag)<cr>
"nnoremap <F4> :call ToggleDiag(isDiag)<cr>
nnoremap <F1> :lua vim.lsp.buf.hover()<cr>
nnoremap <F2> :lua vim.diagnostic.open_float()<cr>
"nnoremap <F10> :lua vim.diagnostic.goto_prev()<cr>
"nnoremap <F11> :lua vim.diagnostic.goto_next()<cr>

" dapui
"nnoremap <F4> :lua require("dapui").toggle()<cr>
"nnoremap <leader><F5> :lua require("dap").continue()<cr>
"nnoremap <leader><S-F5> :lua require("dap").restart()<cr>
"nnoremap <leader><F6> :lua require("dap").pause()<cr>
"nnoremap<leader> <F7> :lua require("dap").repl.open()<cr>
"nnoremap <leader><F8> :lua require("dap").toggle_breakpoint()<cr>
"nnoremap <leader><F9> :lua require("dap").run_last()<cr>
"nnoremap <leader><F10> :lua require("dap").step_over()<cr>
"nnoremap <leader><F11> :lua require("dap").step_into()<cr>
"nnoremap <leader><F12> :lua require("dap").step_out()<cr>
nnoremap <leader>dd :lua require("dapui").toggle()<cr>
nnoremap <leader>dc :lua require("dap").continue()<cr>
nnoremap <leader>dR :lua require("dap").restart()<cr>
nnoremap <leader>dP :lua require("dap").pause()<cr>
"nnoremap <leader>dr :lua require("dap").repl.open()<cr>
nnoremap <leader>db :lua require("dap").toggle_breakpoint()<cr>
nnoremap <leader>dl :lua require("dap").run_last()<cr>
nnoremap <leader>dO :lua require("dap").step_over()<cr>
nnoremap <leader>di :lua require("dap").step_into()<cr>
nnoremap <leader>do :lua require("dap").step_out()<cr>
nnoremap <leader>dh :lua require("dap.ui.widgets").hover()<cr>
nnoremap <leader>dp :lua require("dap.ui.widgets").preview()<cr>
nnoremap <leader>ds :lua require("dap.ui.widgets").widgets.centered_float(widgets.scopes)<cr>
nnoremap <leader>df :lua require("dap.ui.widgets").widgets.centered_float(widgets.frames)<cr>


" GNUInfo
" Only apply the mapping to generated buffers
"if &buftype =~? "nofile" || &buftype =~? "nowrite"
""  nnoremap <buffer> gu :InfoUp<cr>
""  nnoremap <buffer> gn :InfoNext<cr>
""  nnoremap <buffer> gp :InfoPrev<cr>
""  "nnoremap <buffer> gm <Plug>(InfoMenu)
""  function! ToggleInfoMenu()
""    try
""      execute "normal! gm\<Plug>(InfoMenu)"
""    catch /E117/
""      " Handle the error, if needed
""      echo "Error occurred!"
""    endtry
""    execute "q"
""  endfunction
""  nnoremap <buffer> gm :call ToggleInfoMenu()<cr>
""  nnoremap <buffer> gf :InfoFollow<cr>
"  nnoremap gn :VinfoNext<cr>
"  nnoremap gp :VinfoPrev<cr>
"endif
nnoremap gn :VinfoNext<cr>
nnoremap gp :VinfoPrev<cr>


" Undotree
"nnoremap <F5> :UndotreeToggle<cr>:UndotreeFocus<cr>

" Lexplore|NNN
nnoremap <leader>\ :NnnExplorer<cr>

" Firenvim
" nnoremap <leader>'l :set lines=
" nnoremap <leader>'c :set columns=

" Markdown preview
noremap <leader>m :MarkdownPreviewToggle<cr>

" Neogit
nnoremap <leader>G :Neogit<cr>

" Gitsigns
nnoremap <leader>gh :Gitsigns preview_hunk<cr>
nnoremap <leader>gb :Gitsigns toggle_current_line_blame<cr>
nnoremap <leader>gn :Gitsigns next_hunk<cr>
nnoremap <leader>gp :Gitsigns prev_hunk<cr>

" Spellcheck
nnoremap <leader><leader>s :set spell!<cr>
nmap <leader>s z=

" Format buffer
nnoremap <leader><leader>f :lua vim.lsp.buf.format({ async = false })<cr>

" Quickfix
nnoremap <leader>f :vimgrep /\w\+/j % \| copen<cr>

" Navigation
" Move highlighted text
"inoremap J :m +1<cr>
"inoremap K :m -2<cr>
"xnoremap K xkP`[V`]
"xnoremap J xp`[V`]
"xnoremap H <gv
"xnoremap L >gv
" split lines under the cursor
nnoremap E i<CR><Esc>g;
vnoremap N :m '>+1<cr>gv=gv
vnoremap E :m '<-2<cr>gv=gv
nnoremap g[ :lua vim.diagnostic.goto_prev()<cr>
nnoremap g] :lua vim.diagnostic.goto_next()<cr>
nnoremap gd :lua vim.lsp.buf.definition()<cr>
nnoremap gr :lua vim.lsp.buf.references()<cr>
nnoremap gl ``
nnoremap gL ''
nnoremap <leader>R :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>a :lua vim.lsp.buf.code_action()<cr>


" Folding functions
" za/zA toggle current 1 level/toggle current full
" zr/ZR open all 1 level/open all full
" zm/ZM close all 1 level/close all full

" Resize buffer
nnoremap <leader>+ <C-W>1000+
nnoremap <leader>- <C-W>1000-
nnoremap <leader>= <C-W>=
nnoremap <C-W>m <C-W>h
nnoremap <C-W>n <C-W>j
nnoremap <C-W>e <C-W>k
nnoremap <C-W>i <C-W>l
"nnoremap <leader>m <C-W>h
"nnoremap <leader>n <C-W>j
"nnoremap <leader>e <C-W>k
"nnoremap <leader>i <C-W>l
"nnoremap <leader>r <C-w><C-r>
nnoremap <C-s> <C-w><C-r>

" rotate horizontal/vertical buffer"
let g:isHorizontal = 1
function! ToggleRotate(isHorizontal)
  if g:isHorizontal==1
    :exe "normal \<C-w>J"
    let g:isHorizontal = 0
  else
    :exe "normal \<C-w>H"
    let g:isHorizontal = 1
  endif
endfunction
"nnoremap <C-w><C-r> :call ToggleRotate(isHorizontal)<cr>
nnoremap <leader>r :call ToggleRotate(isHorizontal)<cr>

" Center cursor up/down search
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap '[a-z] '[a-z]zz
"nnoremap n <C-u>nzzzv
"nnoremap N <C-d>Nzzzv

" Scrolling content
nnoremap <C-n> <C-e>
nnoremap <C-e> <C-y>

" Remap defaults
nnoremap O O<Esc>
nnoremap o o<Esc>
nnoremap <C-K> :Man <C-r><C-w><cr>
nnoremap <C-S-K> <C-t>
"nnoremap <C-S-K> :Man <C-r><C-w><cr>


" Macro replay
nnoremap <leader>q @@

" Clipboard
set clipboard+=unnamedplus
vnoremap <leader>p "_dP
" nnoremap <leader>d "add
" nnoremap <leader>y "ayy
" nnoremap <leader>c "acc

" Ignores clipboardplus
nnoremap x "bx
nnoremap X "bX
"xnoremap <leader>k \"_dP

" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<cr>/<C-R>/<cr>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<cr>?<C-R>/<cr>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<cr>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

"Paste matching text of last search single word
function! Del_word_delims()
   let reg = getreg('/')
   " After *                i^r/ will give me pattern instead of \<pattern\>
   let res = substitute(reg, '^\\<\(.*\)\\>$', '\1', '' )
   if res != reg
      return res
   endif
   " After * on a selection i^r/ will give me pattern instead of \Vpattern
   let res = substitute(reg, '^\\V'          , ''  , '' )
   let res = substitute(res, '\\\\'          , '\\', 'g')
   let res = substitute(res, '\\n'           , '\n', 'g')
   return res
endfunction
inoremap <silent> <C-R>/ <C-R>=Del_word_delims()<cr>

"Jump to first ocurance of search and go to visual mode
noremap \\ //s<cr>v//e+1<cr>

"Unfold when going in fold going out jk
function! MoveAndFoldLeft()
    let line = getpos('.')[1]
    let col  = getpos('.')[2]

    if l:col ==# 1 && foldlevel(l:line)
        execute "foldclose"
    else
        execute "normal! h"
    endif
endfunction

function! MoveAndFoldRight()
    let line = getpos('.')[1]

    if foldlevel(line) && foldclosed(line) != -1
        execute "foldopen"
    else
        execute "normal! l"
    endif
endfunction

nnoremap <silent> <Left>  :call MoveAndFoldLeft()<cr>
nnoremap <silent> m       :call MoveAndFoldLeft()<cr>
nnoremap <silent> <Right> :call MoveAndFoldRight()<cr>
nnoremap <silent> i       :call MoveAndFoldRight()<cr>

]])
require('plug/wordmotion')
