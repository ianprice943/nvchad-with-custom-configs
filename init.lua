require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)

vim.wo.colorcolumn = '80'

-- https://www.reddit.com/r/neovim/comments/r9q0d9/comment/hniq3xw
vim.diagnostic.config({
  virtual_text = false, -- Turning off inline diagnostics in favor of window
})

vim.o.updatetime = 300

vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)

-- https://youtu.be/qZO9A5F6BZs?t=384
vim.api.nvim_set_keymap(
  'n', '<Leader>p', "\"_dP",
  { noremap = true, silent = true }
)

vim.o.number = true
vim.o.relativenumber = true

vim.o.clipboard = "unnamedplus"

require "plugins"
