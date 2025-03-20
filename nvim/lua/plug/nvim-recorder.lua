require("recorder").setup {
  slots = { "a", "r", "s" },
  dynamicSlots = "rotate",
  editInBuffer = true,
  lessNotifications = true,
}

local lualineA = require("lualine").get_config().sections.lualine_a or {}
table.insert(lualineA, { require("recorder").recordingStatus })
table.insert(lualineA, { require("recorder").displaySlots })

require("lualine").setup {
  sections = {
    lualine_a = lualineA,
  },
}
