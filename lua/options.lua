---@diagnostic disable: undefined-global
local o = vim.o

-- General
o.number = true
o.relativenumber = true
o.scrolloff = 13
o.sidescrolloff = 40
o.termguicolors = true
o.wrap = false
o.cursorline = true
vim.cmd(':set cmdheight=0')
vim.opt.splitbelow = true -- Prio splitting new windows below
vim.opt.splitright = true -- Prio splitting new windows below

-- Tabs
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
o.expandtab = true
o.hlsearch = true
o.incsearch = true

-- Registers
vim.api.nvim_set_option("clipboard", "unnamedplus")
