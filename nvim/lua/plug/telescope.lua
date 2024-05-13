local function theme()
  return {
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    previewer = true,
    layout_config = {
      height = 0.5,
      width = 0.2,
    },
    title = false,
    results_title = false,
  }
end

local function ivy()
  return require('telescope.themes').get_ivy {
    theme(),
    grep_open_files = true,
  }
end

local function cursor()
  return require('telescope.themes').get_cursor {
    theme()
  }
end

local tel = require('telescope')
tel.setup({
  defaults = cursor(),
  pickers = {
    buffers = ivy(),
    live_grep = ivy(),
    current_buffer_fuzzy_find = ivy(),
  },
  extensions = {
    --notify = ivy(),
    undo = {
      side_by_side = true,
      --layout_strategy = "vertical",
      --layout_config = {
      --  preview_height = 0.8,
      --},
    },
  },
})



tel.load_extension("undo")
tel.load_extension("dap")
tel.load_extension("ui-select")
