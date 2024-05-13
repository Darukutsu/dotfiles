-- refer to documentation https://github.com/folke/flash.nvim
require("flash").setup(
  {
    search = {
      incremental = false,
      forward = true,
      wrap = false,
    },
    jump = {},
    label = {
      rainbow = {
        enabled = true,
        shade = 1,
      },
      after = false,
      before = true,
      format = function(opts)
        return { { opts.match.label, opts.hl_group } }
      end,
    },
    highlight = {
      groups = {
        current = "FlashMatch",
      },
    },
    modes = {
      search = {
        enabled = true,
        search = { incremental = true, wrap = true },
        jump = { autojump = true },
      },
      char = {
        enabled = true,
        config = function(opts)
          -- autohide flash when in operator-pending mode
          opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

          -- disable jump labels when not enabled, when using a count,
          -- or when recording/executing registers
          opts.jump_labels = opts.jump_labels
              and vim.v.count == 0
              and vim.fn.reg_executing() == ""
              and vim.fn.reg_recording() == ""

          -- Show jump labels only in operator-pending mode
          -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
        end,
        autohide = true,
        jump_labels = true,
        multi_line = false,
        -- until issue #183 isn't merged uncomment next line
        --label = { exclude = "yYpPdDiIaAsSrRcCxX" },
        --keys = { ["f"] = "H", ["F"] = "H", ["t"] = "H", ["T"] = "H", ";", "," },
        keys = { "f", "F", "t", "T", ";", "," },
        --keys = { ";", "," },
        char_actions = function(motion)
          return {
            [";"] = "next",
            [","] = "prev",
            [motion:lower()] = "next",
            [motion:upper()] = "prev",
          }
        end,
        search = { wrap = false },
        jump = { autojump = true },
      },
      treesitter = {
        labels = "abcdefghijklmnopqrstuvwxyz1234567890",
        jump = { pos = "range" },
        search = { incremental = false },
        label = { before = true, after = true, style = "inline" },
        highlight = {
          backdrop = false,
          matches = false,
        },
      },
      treesitter_search = {
        jump = { pos = "range" },
        search = { multi_window = true, wrap = true, incremental = false },
        remote_op = { restore = true },
        label = { before = true, after = true, style = "inline" },
      },
    },
    prompt = {
      enabled = false,
    },
    remote_op = {
      restore = false,
      motion = false,
    },
  }
)
