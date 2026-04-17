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
vim.opt.splitright = true -- Prio splitting new windows to the right
o.inccommand = "split"

-- Tabs
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Search
o.expandtab = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- Registers
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Safety Net (Backups)
o.backup = true
o.undofile = true
o.undodir = "~/.local/share/nvim/undo"
