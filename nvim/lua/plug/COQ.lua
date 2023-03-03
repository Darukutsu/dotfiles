local remap = vim.api.nvim_set_keymap


-- LSP
--require('mason-lspconfig').setup{
--  ensure_installed = {"ltex"}
--}

--require('lspconfig').clangd.setup{}
--require('lspconfig').ltex.setup{}
--require('lspconfig').bashls.setup{}

-- Linters
require('lint').linters_by_ft = {
  ['markdown'] = { 'markdownlint', },
  --['sh'] = {'shellcheck',},
  ['c'] = { 'cpplint', },
  --['python'] = {'pylint',},
}
vim.cmd('autocmd BufEnter,BufWritePost,InsertLeave * lua require("lint").try_lint()')

--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  callback = function()
--    require('lint').try_lint()
--  end,
--})


-- COQ setup
local lsp = require("lspconfig")
local coq = require("coq")
--lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities())

--vim.g.coq_settings = { auto_start = 'shut-up' }
--vim.g.coq_settings = { keymap = { recommended = true } }
--vim.g.coq_settings = { keymap = { recommended = false } }
--vim.g.coq_settings = { ["[].always_on_top"] = true }

--		      "lsp": {"always_on_top": None} }

--vim.g.coq_settings = { ["clients.[].always_on_top"] = true }
--coq_settings.clients.[].always_on_top

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
--remap('n', '<C-space>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
--remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
--remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
--remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
--remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })


-- autopair + COQ setup
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
