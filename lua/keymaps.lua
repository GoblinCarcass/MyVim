---@diagnostic disable: undefined-global
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bread and butter
map("i", "jk", "<Esc>")
map("n", ";", ":")
map("n", "<Leader>d", '"_d', { desc = "Delete without saving in the register in normal mode" })
map("v", "<Leader>d", '"_d', { desc = "Delete without saving in the register in visual mode" })
map("n", "<A-j>", ":m .+1<CR>>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>>==", { desc = "Move line up" })
map("n", "<Leader>q", ":q<CR>", { desc = "Quit NeoVim" })
map("n", "<Leader>w", ":w<CR>", { desc = "Write to file" })
map("n", "<Leader>wq", ":wq<CR>", { desc = "Write, then Quit" }) -- Lmao that command gives me cancer, I love it
map("n", "<Leader>Q", ":q!<CR>", { desc = "Get me the fuck out of here!" })
map("n", "<leader>v", "vg_", { noremap = true, desc = "Select to last non-blank character" })
map("n", "<leader>sc", ":set spell!<CR>", { desc = "Toggle spellcheck" })
map("n", "<leader>su", "z=", { desc = "Spellcheck word autosuggestion" })
map({ "n", "v" }, "gh", "_", { noremap = true, desc = "Go to start of line" })
map({ "n", "v" }, "gl", "$", { noremap = true, desc = "Go to end of line" })

-- Window and Terminal Splitting
map("n", "<Leader>sh", ":sp<CR>", { desc = "Split window horizontally" })
map("n", "<Leader>sv", ":vsp<CR>", { desc = "Split window vertically" })
map("n", "<Leader>tt", ":ToggleTerm size=100<CR>", { desc = "Toggle Terminal"})
map("n", "<Leader>th", ":ToggleTerm direction=horizontal name=workspace<CR>", { desc = "Split terminal horizontally"})
map("n", "<Leader>tv", ":ToggleTerm size=30 direction=vertical name=workspace<CR>", { desc = "Split terminal vertically"})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<Leader>ff", builtin.find_files, { desc = "Telescope - Find files in the current directory!" })
map(
  "n",
  "<Leader>fg",
  builtin.live_grep,
  { desc = "Telescope - Live search for a keyword in your current working directory" }
)
map(
  "n",
  "<Leader>fd",
  builtin.current_buffer_fuzzy_find,
  { desc = "Telescope - Live search for a keyword in a current buffer" }
)
map("n", "<Leader>fz", builtin.git_files, { desc = "Telescope - Fuzzy find through git commits" })

-- Buffer Manager
local buf_man = require("buffer_manager.ui")
map("n", "<Leader>fb", buf_man.toggle_quick_menu, { desc = "Live search through all of your opened buffer" })
map("n", "<C-j>", buf_man.nav_next, { noremap = true, desc = "Live search through all of your opened buffers" })
map("n", "<C-k>", buf_man.nav_prev, { noremap = true, desc = "Live search through all of your opened buffers" })

-- Oil
map("n", "<Leader>cd", ":Oil<CR>", { desc = "Open Oil file explorer" })

-- Neo-tree
map("n", "<C-n>", ":Neotree show filesystem toggle right reveal<CR>", { desc = "Open up Neotree" })

-- Lsp
map("n", "K", vim.lsp.buf.hover, { noremap = true, desc = "Display the hover information of a token under the cursor" })
map(
  "n",
  "<Leader>rn",
  vim.lsp.buf.rename,
  { desc = "Rename all references to the symbol under the cursor e.g. variable name." }
)
map("n", "<Leader>gd", vim.lsp.buf.definition, { desc = "Display the hover information of a token under the cursor" })
map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Perform a code action on a token under the cursor" })
map("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format the document" })

-- Keep cursor centered after movement
map("n", "G", "Gzz", { noremap = true, desc = "Go to bottom and center" })
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })
map("n", "*", "*zz", { noremap = true })
map("n", "#", "#zz", { noremap = true })
map("n", "g*", "g*zz", { noremap = true })
map("n", "g#", "g#zz", { noremap = true })

-- WhichKey
map({ "n", "v" }, "<leader>?", function() require("which-key").show({ global = false }) end,
  { desc = "Buffer Local Keymaps (which-key)" })

-- Flash
map({ "n", "x", "o" }, "ss", function()
  require("flash").jump()
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

--[[ Left the shortcuts from Flash for reference
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
--]]

-- Mini.splitjoin
require("mini.splitjoin").setup({
  mappings = {
    toggle = "<leader>m",
    split = "<Leader>s",
    join = "<Leader>j",
  },
})

-- Mini.completion
require("mini.completion").setup({
  mappings = {
    scroll_down = "<C-Down>",
    scroll_up = "<C-Up>",
  },
})

-- Wrapping
map("n", "<leader>wt", function() require('wrapping').toggle_wrap_mode() end, { desc = "Toggle wrap mode"})
