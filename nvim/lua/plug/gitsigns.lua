require('gitsigns').setup({
  signs = {
    add          = { show_count = true },
    change       = { show_count = true },
    delete       = { show_count = true },
    topdelete    = { show_count = true },
    changedelete = { show_count = true },
  },
  --count_chars = {
  --  [1]   = '₁',
  --  [2]   = '₂',
  --  [3]   = '₃',
  --  [4]   = '₄',
  --  [5]   = '₅',
  --  [6]   = '₆',
  --  [7]   = '₇',
  --  [8]   = '₈',
  --  [9]   = '₉',
  --  ['+'] = '',
  --},
  current_line_blame_opts = {
    delay = 400,
  },
})
