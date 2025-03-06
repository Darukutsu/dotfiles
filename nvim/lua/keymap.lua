local map = vim.keymap.set
local unmap = vim.keymap.del

--vim.cmd([[
--noremap k m
--noremap j e
--noremap h n
--"noremap l i
--nnoremap l i
--noremap m h
--noremap n j
--noremap e k
--noremap i l
--"noremap K <nop>
--"noremap H M
--noremap J E
--noremap H N
--noremap L I
--noremap M H
--noremap N J
--noremap E K
--"noremap I L
--"map H H
--]])

map({ "t" }, "<C-S-h>", "<C-\\><C-n>")

vim.g.mapleader = " "

map({ "n" }, "<leader>;", ":noh<cr>", { silent = true })

-- vim-wordmotion
map({ "n", "v", "o" }, "W", "w", {})
map({ "x", "o" }, "aW", "aw", {})
map({ "x", "o" }, "iW", "iw", {})
-- For chaoren/vim-wordmotion colemak
--vim.cmd([[
--  let g:wordmotion_mappings={  'e':'', 'E':'', 'j':'<M-e>', 'J':'<M-E>',  }
--]])
--
-- For chrisgrieser/nvim-spider
map({ "n", "o", "x" },
  "w",
  function() require('spider').motion('w') end, {})
map({ "n", "o", "x" },
  "b",
  function() require('spider').motion('b') end, {})
map({ "n", "o", "x" },
  "e",
  function() require('spider').motion('e') end, {})

map({ "n", "o", "x" },
  "W",
  function() require('spider').motion('w', { subwordMovement = false }) end, {})
map({ "n", "o", "x" },
  "B",
  function() require('spider').motion('b', { subwordMovement = false }) end, {})
map({ "n", "o", "x" },
  "E",
  function() require('spider').motion('e', { subwordMovement = false }) end, {})
--"func() require('spider').motion('e', { subwordMovement = false, skipInsignificantPunctuation=false })<CR>", {})

-- for chrisgrieser/nvim-various-textobjs
--map({ "o", "x" }, "lw", function() require('various-textobjs').subword('inner') end)
map({ "o", "x" }, "iw", function() require('various-textobjs').subword('inner') end)
map({ "o", "x" }, "aw", function() require('various-textobjs').subword('outer') end)
--map({ "o", "x" }, "iW", function() require('various-textobjs').subword('inner')end)
--map({ "o", "x" }, "lW", function() require('various-textobjs').subword('inner')end)
--map({ "o", "x" }, "aW", function() require('various-textobjs').subword('outer')end)
map({ "o", "x" }, "au", function() require('various-textobjs').url() end)
map({ "o", "x" }, "iu", function() require('various-textobjs').url() end)

-- COQ these mappings are coq recommended mappings unrelated to nvim-autopairs
-- doesn't work with lazyvim for some reason
--map('i', '<esc>', [[pumvisible() ? "<c-k><esc>" : "<esc>"]], { expr = true, noremap = true })
--map('i', '<c-c>', [[pumvisible() ? "<c-k><c-c>" : "<c-c>"]], { expr = true, noremap = true })
--map('i', '<tab>', [[pumvisible() ? "<c-j>" : "<tab>"]], { expr = true, noremap = true })
--map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
--map('i', '<cr>', [[pumvisible() ? (complete_info().selected != -1 ? "<c-y><esc>" : "<c-k><cr>") : "<cr>"]],
--  { expr = true, noremap = true })

-- Flash.nvim
function Motion_f()
  require('flash').jump({
    search = {
      forward = true,
    },
    jump = {
      inclusive = true,
    },
    -- doesn't do anything for now disable this at top level
    modes = {
      char = {
        multi_line = false,
      },
    },
  });
end

function Motion_t()
  require('flash').jump({
    search = {
      forward = true,
    },
    jump = {
      inclusive = false,
    },
    modes = {
      char = {
        multi_line = false,
      },
    },
  });
end

function Motion_F()
  require('flash').jump({
    search = {
      forward = false,
    },
    jump = {
      inclusive = true,
    },
    modes = {
      char = {
        multi_line = false,
      },
    },
  });
end

function Motion_T()
  require('flash').jump({
    search = {
      forward = false,
    },
    jump = {
      inclusive = true,
      offset = 1,
    },
    modes = {
      char = {
        multi_line = false,
      },
    },
  });
end

local rules = { silent = true, noremap = true }
map({ "o" }, "t", function() Motion_t() end, rules)
map({ "o" }, "f", function() Motion_f() end, rules)
map({ "o" }, "T", function() Motion_T() end, rules)
map({ "o" }, "F", function() Motion_F() end, rules)

-- behave like original OPERATION-MODE
--vim.api.nvim_del_keymap("o", "t")
--vim.api.nvim_del_keymap("o", "f")
--vim.api.nvim_del_keymap("o", "T")
--vim.api.nvim_del_keymap("o", "F")

-- Ccc pick
map({ "n" }, "<leader>c", ":CccPick<cr>", { desc = "color picker" })


-- Markdown preview
map({ "n" }, "<leader><leader>m", ":MarkdownPreviewToggle<cr>", { desc = "markdown preview" })

-- Neogit
map({ "n" }, "<leader>G", ":Neogit<cr>", { desc = "neogit" })

-- Gitsigns
map({ "n" }, "<leader>gh", ":Gitsigns preview_hunk<cr>", {})
map({ "n" }, "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", {})
map({ "n" }, "<leader>gn", ":Gitsigns next_hunk<cr>", {})
map({ "n" }, "<leader>gp", ":Gitsigns prev_hunk<cr>", {})

-- Spellcheck
map({ "n" }, "<leader><leader>S", ":set spell!<cr>", { desc = "toggle spell" })
map({ "n" }, "<leader><leader>s", function() require("telescope.builtin").spell_suggest() end, { desc = "spell suggest" })
--map({ "n" }, "<leader>s", "z=", {})

-- Nnn explorer for showoff
map({ "n" }, "<leader><leader>n", ":NnnExplorer<cr>", { desc = "nnn explorer" })

-- Format buffer
map({ "n" }, "<leader><leader>f", function() vim.lsp.buf.format({ async = false }) end, { desc = "format buffer" })

-- Quickfix
--map({ "n" }, "<leader>f", ":vimgrep /\\w\\+/j % \\| copen<cr>", {})

-- Split lines under the cursor
map({ "n" }, "K", "i<CR><Esc>g;", {})

-- NOTE: use mini.move instead
-- Move highlighted text
--map({ "v" }, "<M-j>", ":m '>+1<cr>gv=gv", {})
--map({ "v" }, "<M-k>", ":m '<-2<cr>gv=gv", {})

-- Paste single line N times for visual block
--local function paste_mul()
--  local block_start=vim.api.nvim_call_function("line", {"'<"})
--  local block_end=vim.api.nvim_call_function("line", {"'>"})
--  local col_start=vim.api.nvim_call_function("col", {"'<"})
--  local col_end=vim.api.nvim_call_function("col", {"'>"})
--  for i in block_end - block_start do
--    vim.api.nvim_cmd("normal " + col_start + "|\\<C-v>" + col_end + "|")
--  end
--end
--map({ "v" }, "<leader>P", paste_mul(), {})


-- Navigation
map({ "n" }, "g[", function() vim.diagnostic.goto_prev() end, {})
map({ "n" }, "g]", function() vim.diagnostic.goto_next() end, {})
map({ "n" }, "gd", function() vim.lsp.buf.definition() end, {})
map({ "n" }, "gr", function() vim.lsp.buf.references() end, {})
map({ "n" }, "gl", "``", {})
map({ "n" }, "gL", "''", {})
map({ "n" }, "<leader>R", function() vim.lsp.buf.rename() end, { desc = "LSP Rename cursor" })
--map({ "n" }, "<leader>a", function() vim.lsp.buf.code_action() end, {})


-- Center cursor up/down search
map({ "n", "v", "o" }, "<C-u>", "<C-u>zz", {})
map({ "n", "v", "o" }, "<C-d>", "<C-d>zz", {})
map({ "n", "v", "o" }, "'[a-z]", "'[a-z]zz", {})
--map({ "n", "v", "o" }, "n", "<C-u>nzzzv", {})
--map({ "n", "v", "o" }, "N", "<C-d>Nzzzv", {})

-- Scrolling content
map({ "n", "v", "o" }, "<C-j>", "<C-e>", {})
map({ "n", "v", "o" }, "<C-k>", "<C-y>", {})

-- Remap defaults
map({ "n" }, "O", "O<Esc>", {})
map({ "n" }, "o", "o<Esc>", {})
map({ "n" }, "<C-M>", ":Man <C-r><C-w><cr>", {})
map({ "n" }, "<C-S-M>", "<C-t>", {})
--map({ "n" }, "<C-S-K>", ":Man <C-r><C-w><cr>", {})


-- Macro replay
--map({ "n" }, "<leader>q", "@@", {})

-- Clipboard
map({ "n" }, "<leader>p", "\"_dP", {})
-- nnoremap <leader>d "add
-- nnoremap <leader>y "ayy
-- nnoremap <leader>c "acc

-- Ignores clipboardplus
map({ "n" }, "x", "\"bx", {})
map({ "n" }, "X", "\"bX", {})
--xnoremap <leader>k \"_dP

-- Telescope shortcut
map({ "n" }, "<leader>f", function() vim.find_files_from_project_git_root() end, { desc = "jump files" })
map({ "n" }, "<leader><Tab>", ":Telescope buffers<cr>", { desc = "jump buffers" })

map({ "n" }, "<leader>c", ":Telescope commands<cr>")
map({ "n" }, "<leader>v", ":Telescope vim_options<cr>")
--map({ "n" }, "<leader>t", ":Telescope builtin include_extensions=true<cr>")

map({ "n" }, "<leader>?a", function() vim.lsp.buf.code_action() end, { desc = "code actions" })
map({ "n" }, "<leader>?k", ":Telescope keymaps<cr>", { desc = "keymaps" })
map({ "n" }, "<leader>?s", ":Telescope lsp_document_symbols<cr>", { desc = "document symbols" })
map({ "n" }, "<leader>?S", ":Telescope lsp_document_symbols<cr>", { desc = "workspace symbols" })
map({ "n" }, "<leader>?d", ":Telescope diagnostics bufnr=0<cr>", { desc = "workspace diagnostics" })
map({ "n" }, "<leader>?D", ":Telescope diagnostics<cr>", { desc = "workspace diagnostics" })

map({ "n" }, "\\", ":Telescope current_buffer_fuzzy_find<cr>", { desc = "fzf cur_buffer" })
map({ "n" }, "<leader>/", ":Telescope live_grep<cr>", { desc = "telescope grep buffers" })

map({ "n" }, "<leader>u", ":Telescope undo<cr>", { desc = "telescope undo" })

-- Dap
map({ "n" }, "<leader>dc", ":Telescope dap commands<cr>")
map({ "n" }, "<leader>db", ":Telescope dap list_breakpoints<cr>")
map({ "n" }, "<leader>du", function() require("dapui").toggle() end)

-- Notification history
map({ "n" }, "<leader>n", ":Telescope notify<cr>", { desc = "notification history" })

-- Overseer
map({ "n" }, "<leader>o", ":OverseerRun<cr>", { desc = "Overseer run command" })



-- Count time values together HH:MM:SS in visual block
map({ "v" }, "<leader><leader>c",
  ":'<,'>!xargs -I{} date +\\%s --date '1970-1-1 {}' \\| awk '{sum += ($1+3600)} END {printf \"\\%.2d:\\%.2d:\\%.2d\", sum/3600, (sum\\%3600)/60, sum\\%60}'<cr>",
  { desc = "SUM time values visual" })


vim.cmd([[

" flash fF movement


" Tokyo Theme switch
let g:isDark = 1
function! ToggleTheme(isDark)
  if g:isDark==1
    :lua vim.o.background = "light"
    :silent !kitty +kitten themes --reload-in=all "Tokyo Night Day"
    :exe "normal ne"
    let g:isDark = 0
  else
    :lua vim.o.background = "dark"
    :silent !kitty +kitten themes --reload-in=all "Tokyo Night Storm"
    :exe "normal ne"
    let g:isDark = 1
  endif
endfunction
nnoremap <leader><leader>t :call ToggleTheme(isDark)<cr>


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
"nnoremap <leader>dc :lua require("dap").continue()<cr>
"nnoremap <leader>dR :lua require("dap").restart()<cr>
"nnoremap <leader>dP :lua require("dap").pause()<cr>
""nnoremap <leader>dr :lua require("dap").repl.open()<cr>
"nnoremap <leader>db :lua require("dap").toggle_breakpoint()<cr>
"nnoremap <leader>dl :lua require("dap").run_last()<cr>
"nnoremap <leader>dO :lua require("dap").step_over()<cr>
"nnoremap <leader>di :lua require("dap").step_into()<cr>
"nnoremap <leader>do :lua require("dap").step_out()<cr>
"nnoremap <leader>dh :lua require("dap.ui.widgets").hover()<cr>
"nnoremap <leader>dp :lua require("dap.ui.widgets").preview()<cr>
"nnoremap <leader>ds :lua require("dap.ui.widgets").widgets.centered_float(widgets.scopes)<cr>
"nnoremap <leader>df :lua require("dap.ui.widgets").widgets.centered_float(widgets.frames)<cr>


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
"nnoremap gn :VinfoNext<cr>
"nnoremap gp :VinfoPrev<cr>

" Undotree
"nnoremap <F5> :UndotreeToggle<cr>:UndotreeFocus<cr>

" Lexplore|NNN
"nnoremap <leader>\ :NnnExplorer<cr>

" Firenvim
" nnoremap <leader>'l :set lines=
" nnoremap <leader>'c :set columns=

" Folding functions
" za/zA toggle current 1 level/toggle current full
" zr/ZR open all 1 level/open all full
" zm/ZM close all 1 level/close all full

" Resize buffer
nnoremap <leader>+ <C-W>1000+
nnoremap <leader>- <C-W>1000-
nnoremap <leader>= <C-W>=
"nnoremap <C-W>m <C-W>h
"nnoremap <C-W>n <C-W>j
"nnoremap <C-W>e <C-W>k
"nnoremap <C-W>i <C-W>l
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
"nnoremap <leader>r :call ToggleRotate(isHorizontal)<cr>


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

" Paste matching text of last search single word
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

" Jump to first ocurance of search and go to visual mode
" don't see point of this... maybe revork to select whole selection in visual
" noremap \\ //s<cr>v//e+1<cr>

" Unfold when going in fold going out jk
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
nnoremap <silent> h       :call MoveAndFoldLeft()<cr>
nnoremap <silent> <Right> :call MoveAndFoldRight()<cr>
nnoremap <silent> l       :call MoveAndFoldRight()<cr>
]])
