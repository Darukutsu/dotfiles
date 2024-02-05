-- COQ setup
local coq = require("coq")
local remap = vim.api.nvim_set_keymap
vim.g.coq_settings = {
  auto_start = "shut-up",
  keymap = { recommended = false },
}

require("coq_3p") {
  {
    src = "figlet",
    short_name = "BIG",
    trigger = "!big",
    fonts = { "/usr/share/figlet/fonts/standard.flf" }
  },
  { src = "bc", short_name = "MATH", precision = 6 },
}

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
remap('i', '<cr>', [[pumvisible() ? "<c-y><esc>" : "<cr>"]], { expr = true, noremap = true })
--remap('i', '<s-tab>', [[pumvisible() ? "<c-y>" : "<bs>"]], { expr = true, noremap = true })

-- autopair + COQ setup
--local npairs = require('nvim-autopairs')
--
--npairs.setup({
--  disable_in_macro = true,
--  disable_in_visualblock = true,
--  check_ts = true,
--  fast_wrap = {
--    map = '<C-e>',
--  },
--  map_bs = false,
--  map_cr = false,
--})
--
---- skip it, if you use another global object
--_G.MUtils = {}
--
--MUtils.CR = function()
--  if vim.fn.pumvisible() ~= 0 then
--    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
--      return npairs.esc('<c-y>')
--    else
--      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
--    end
--  else
--    return npairs.autopairs_cr()
--  end
--end
--remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
--
--MUtils.BS = function()
--  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
--    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
--  else
--    return npairs.autopairs_bs()
--  end
--end
--remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
