-- Dap config
local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch C/C++/Rust Debug LLDB',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

--require("dapui").setup({
--  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
--  mappings = {
--    -- Use a table to apply multiple mappings
--    expand = { "<CR>", "<2-LeftMouse>" },
--    open = "o",
--    remove = "d",
--    edit = "e",
--    repl = "r",
--    toggle = "t",
--  },
--  -- Expand lines larger than the window
--  -- Requires >= 0.7
--  expand_lines = vim.fn.has("nvim-0.7") == 1,
--  -- Layouts define sections of the screen to place windows.
--  -- The position can be "left", "right", "top" or "bottom".
--  -- The size specifies the height/width depending on position. It can be an Int
--  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
--  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
--  -- Elements are the elements shown in the layout (in order).
--  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
--  layouts = {
--    {
--      elements = {
--      -- Elements can be strings or table with id and size keys.
--        { id = "scopes", size = 0.25 },
--        "breakpoints",
--        "stacks",
--        "watches",
--      },
--      size = 40, -- 40 columns
--      position = "left",
--    },
--    {
--      elements = {
--        "repl",
--        "console",
--      },
--      size = 0.25, -- 25% of total lines
--      position = "bottom",
--    },
--  },
--  controls = {
--    -- Requires Neovim nightly (or 0.8 when released)
--    enabled = true,
--    -- Display controls in this element
--    element = "repl",
--    icons = {
--      pause = "",
--      play = "",
--      step_into = "",
--      step_over = "",
--      step_out = "",
--      step_back = "",
--      run_last = "↻",
--      terminate = "□",
--    },
--  },
--  floating = {
--    max_height = nil, -- These can be integers or a float between 0 and 1.
--    max_width = nil, -- Floats will be treated as percentage of your screen.
--    border = "single", -- Border style. Can be "single", "double" or "rounded"
--    mappings = {
--      close = { "q", "<Esc>" },
--    },
--  },
--  windows = { indent = 1 },
--  render = {
--    max_type_length = nil, -- Can be integer or nil.
--    max_value_lines = 100, -- Can be integer or nil.
--  }
--})

