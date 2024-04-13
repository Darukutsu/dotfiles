require 'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = false,
  -- which builtin marks to show. default {}
  --builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "bookmark0",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = true,
  },
  mappings = {
    toggle = "h,",
    preview = "h:",
    delete_buf = "dh<space>",
    delete_line = "dh-",
    next = "h]",
    prev = "h[",

    annotate = "Ha",
    set_bookmark0 = "H0",
    set_bookmark1 = "H1",
    set_bookmark2 = "H2",
    set_bookmark3 = "H3",
    set_bookmark4 = "H4",
    set_bookmark5 = "H5",
    set_bookmark6 = "H6",
    set_bookmark7 = "H7",
    set_bookmark8 = "H8",
    set_bookmark9 = "H9",
    delete_bookmark = "dH",
    next_bookmark = "H]",
    prev_bookmark = "H[",
  }
}
