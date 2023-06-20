local tel = require('telescope')
tel.setup({
  defaults = {
  },
  pickers = {
    theme = "dropdown",
    live_grep = {
      grep_open_files = true,
    }
  },
  extensions = {
    undo = {
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
    },
  },
})

tel.load_extension("undo")
tel.load_extension("dap")
