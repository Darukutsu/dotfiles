-- see https://github.com/nvim-treesitter/nvim-treesitter-textobjects
local textobjects = {
  --select = {
  --  enable = true,
  --  lookahead = true,

  --  keymaps = {
  --    -- @statement works on sentences too
  --    ["as"] = { query = "@statement.outer", desc = "outer statement" },
  --    ["is"] = { query = "@statement.outer", desc = "inner statement" },
  --    ["aa"] = { query = "@parameter.outer", desc = "outer parameter" },
  --    ["ia"] = { query = "@parameter.inner", desc = "inner parameter" },
  --    ["af"] = { query = "@function.outer", desc = "outer function" },
  --    ["if"] = { query = "@function.inner", desc = "inner function" },
  --    ["ac"] = { query = "@class.outer", desc = "outer class" },
  --    ["ic"] = { query = "@class.inner", desc = "inner class" },
  --    ["al"] = { query = "@loop.outer", desc = "outer loop" },
  --    ["il"] = { query = "@loop.inner", desc = "inner loop" },
  --    ["ai"] = { query = "@conditional.outer", desc = "outer condi" },
  --    ["ii"] = { query = "@conditional.inner", desc = "inner condi" },
  --  },
  --  --selection_modes = {
  --  --  ['@parameter.outer'] = 'v', -- charwise
  --  --  ['@function.outer'] = 'V',  -- linewise
  --  --  ['@class.outer'] = '<c-v>', -- blockwise
  --  --},
  --  include_surrounding_whitespace = true,
  --},

  swap = {
    enable = true,
    swap_next = {
      ["<leader>sa"] = "@parameter.inner",
      ["<leader>ss"] = "@statement.inner",
      ["<leader>si"] = "@conditional.inner",
    },
    swap_previous = {
      ["<leader>sA"] = "@parameter.inner",
      ["<leader>sS"] = "@statement.inner",
      ["<leader>sI"] = "@conditional.inner",
    },
  },

  move = {
    enable = true,
    set_jumps = true,
    --goto_next_start = {
    --  ["]m"] = { query = "@function.*", desc = "jmp start func" },
    --  ["]f"] = { query = "@function.*", desc = "jmp start func" },
    --  --["]]"] = { query = "@class.outer", desc = "Next class start" },
    --  ["]o"] = { query = "@loop.*", desc = "jmp start loop" },
    --  ["]l"] = { query = "@loop.*", desc = "jmp start loop" },
    --  -- custom jumps see doc. add more of these
    --  ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
    --  ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    --},
    --goto_next_end = {
    --  ["]M"] = { query = "@function.*", desc = "jmp NEnd func" },
    --  ["]F"] = { query = "@function.*", desc = "jmp NEnd func" },
    --  --["]["] = { query = "@class.*", desc = "jmp NEnd class" },
    --  ["]p"] = { query = "@parameter.*", desc = "jmp NEnd param" },
    --  ["]a"] = { query = "@parameter.*", desc = "jmp NEnd param" },
    --},
    --goto_previous_start = {
    --  ["[m"] = { query = "@function.*", desc = "jmp PStart func" },
    --  ["[f"] = { query = "@function.*", desc = "jmp PStart func" },
    --  --["[["] = { query = "@class.*", desc = "jmp PStart class" },
    --  ["[o"] = { query = "@loop.*", desc = "jmp PStart func" },
    --},
    --goto_previous_end = {
    --  ["[M"] = { query = "@function.*", desc = "jmp PEnd func" },
    --  ["[F"] = { query = "@function.*", desc = "jmp PEnd func" },
    --  --["[]"] = { query = "@class.*", desc = "jmp PEnd class" },
    --  ["[p"] = { query = "@parameter.*", desc = "jmp PEnd param" },
    --  ["[a"] = { query = "@parameter.*", desc = "jmp PEnd param" },
    --},

    goto_next = {
      ["]f"] = { query = "@function.outer", desc = "next func" },
      ["]p"] = { query = "@parameter.outer", desc = "next param" },
      ["]s"] = { query = "@statement.outer", desc = "next statement" },
      ["]c"] = { query = "@class.outer", desc = "next class" },
      ["]d"] = { query = "@conditional.outer", desc = "next condi" },
      ["]i"] = { query = "@conditional.outer", desc = "next condi" },
      ["]o"] = { query = "@loop.outer", desc = "next loop" },
      ["]l"] = { query = "@loop.outer", desc = "next loop" },
      ["]r"] = { query = "@return.outer", desc = "next return" },
    },
    goto_previous = {
      ["[f"] = { query = "@function.outer", desc = "prev func" },
      ["[p"] = { query = "@parameter.outer", desc = "prev param" },
      ["[s"] = { query = "@statement.outer", desc = "prev statement" },
      ["[c"] = { query = "@class.outer", desc = "prev class" },
      ["[d"] = { query = "@conditional.outer", desc = "prev condi" },
      ["[i"] = { query = "@conditional.outer", desc = "prev condi" },
      ["[o"] = { query = "@loop.outer", desc = "prev loop" },
      ["[l"] = { query = "@loop.outer", desc = "prev loop" },
      ["[r"] = { query = "@return.outer", desc = "prev return" },
    }
  },

}

-- colorize text depending on language
local ts = require 'nvim-treesitter.configs'
ts.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "cmake",
    --"cpp",
    --"css",
    "diff",
    "go",
    "html",
    --"javascript",
    --"latex",
    "lua",
    "make",
    --"markdown",
    --"markdown_inline",
    --"meson",
    "passwd",
    --"php",
    "python",
    "regex",
    "rust",
  },

  ignore_install = { "zig" },

  sync_install = false,
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    --disable = {
    --  "python",
    --},
  },
  autotag = {
    enable = true,
  },
}

if package.loaded["nvim-next"] then
  ts.setup {
    nvim_next = {
      enable = true,
      textobjects = textobjects,
    },
  }
else
  ts.setup {
    textobjects = textobjects,
  }
end

--local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
--vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
--vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
--vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
--vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
--vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
--vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
