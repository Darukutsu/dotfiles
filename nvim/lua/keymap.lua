vim.cmd([[

let mapleader = " "
nnoremap <leader>; :noh<cr>
"nnoremap <leader>/ :let a = input("Enter value: ") \| lvim a % \| lopen<cr>
nnoremap <leader>/ :Telescope live_grep<cr>

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
"nnoremap <leader>gs <cmd>Telescope git_status<cr>

" LSP enable(def)/disable
let g:isLSP = 1
function! ToggleLsp(isLSP)
  if g:isLSP==1 
    :LspStop<cr> 
    let g:isLSP = 0
  else
    :LspStart<cr>
    let g:isLSP = 1
  endif
endfunction
nnoremap <F4> :call ToggleLsp(isLSP)<cr>

" Info
" Only apply the mapping to generated buffers
"if &buftype =~? 'nofile'
"    nmap <buffer> gu <Plug>(InfoUp)
"    nmap <buffer> gn <Plug>(InfoNext)
"    nmap <buffer> gp <Plug>(InfoPrev)
"endif
nnoremap gu :InfoUp<cr>
nnoremap gn :InfoNext<cr>
nnoremap gp :InfoPrev<cr>
nnoremap gm :Menu<cr>
nnoremap gf :Follow<cr>


" Undotree
nnoremap <F5> :UndotreeToggle<cr>:UndotreeFocus<cr>

" Lexplore|NNN
nnoremap <leader>\ :NnnExplorer<cr>

" Firenvim
nnoremap <leader>'l :set lines=0
nnoremap <leader>'c :set columns=00

" Markdown preview
nnoremap <leader>m :MarkdownPreviewToggle<cr>

" Gitsigns
nnoremap <leader>g :Gitsigns preview_hunk<cr>
nnoremap <leader>b :Gitsigns toggle_current_line_blame<cr>
nnoremap <leader>] :Gitsigns next_hunk<cr>
nnoremap <leader>[ :Gitsigns prev_hunk<cr>

" Spellcheck
nnoremap <leader>s :set spell!<cr>
nnoremap <leader><leader> z=

" Navigation
" Move highlighted text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv 

" Folding functions
" za/zA toggle current 1 level/toggle current full
" zr/ZR open all 1 level/open all full
" zm/ZM close all 1 level/close all full

" Resize buffer
nnoremap <leader>+ <C-W>1000+
nnoremap <leader>- <C-W>1000-
nnoremap <leader>= <C-W>=
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l

" Center cursor up/down search
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap '[a-z] '[a-z]zz
"nnoremap n <C-u>nzzzv
"nnoremap N <C-d>Nzzzv

" Scrolling content
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" Macro replay
nnoremap <leader>q @@

" Clipboard
set clipboard+=unnamedplus
nnoremap <leader>p "ap
nnoremap <leader>P "aP
nnoremap <leader>d "add
nnoremap <leader>y "ayy
nnoremap <leader>c "acc

" Ignores clipboardplus
nnoremap x "bx
nnoremap X "bX
"xnoremap <leader>k \"_dP

" Select and search for block of text
"vnoremap \\ y/\V<C-R>=escape(@",'/\')<cr><cr>


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

"jump to first ocurance of search and go to visual mode
noremap \\ //s<cr>v//e+1<cr>

]])
