---@diagnostic disable: undefined-global
local gh = function(x)
	return "https://github.com/" .. x
end --GitHub helper

--[[
local cb = function(x)
	return "https://codeberg.org/" .. x
end -- Codeberg helper
--]]

-- Packages
vim.pack.add({
	gh("folke/tokyonight.nvim"),
	gh("nvim-lua/plenary.nvim"),
	gh("MunifTanjim/nui.nvim"),
	gh("nvim-tree/nvim-web-devicons"),
	gh("j-morano/buffer_manager.nvim"),
	gh("folke/which-key.nvim"),
	gh("3rd/image.nvim"),
	gh("akinsho/toggleterm.nvim"),

	gh("nvim-mini/mini.nvim"),
	gh("nvim-neo-tree/neo-tree.nvim"),
	gh("stevearc/oil.nvim"),
	gh("folke/flash.nvim"),
	gh("abecodes/tabout.nvim"),
	gh("numToStr/Comment.nvim"),
	gh("MeanderingProgrammer/render-markdown.nvim"),

	{ src = gh("nvim-treesitter/nvim-treesitter"), lazy = false, build = ":TSUpdate" },
	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-telescope/telescope-ui-select.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("j-hui/fidget.nvim"),
	gh("norcalli/nvim-colorizer.lua"),
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("neovim/nvim-lspconfig"),

	gh("nvimtools/none-ls.nvim"),
	gh("nvimtools/none-ls-extras.nvim"),
})
-- Toggleterm
require("toggleterm").setup({
  hide_numbers = true,
})
-- Image Render
require("image").setup()

-- Render Markdown
require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})

-- Tabout
require("tabout").setup()

-- Lualine
require("lualine").setup({
	options = {
		theme = "modus-vivendi",
	},
})

-- Telescope
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
	find_files = {
		hidden = true,
	},
})

require("telescope").load_extension("ui-select")

-- Oil
require("oil").setup({
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
	view_options = {
		show_hidden = true,
	},
})

-- Mini stuff
require("mini.ai").setup()
require("mini.snippets").setup()
require("mini.icons").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.cursorword").setup()

--Treesitter
require("nvim-treesitter").setup({
	textobjects = {
		select = {
			enable = false,
		},
	},
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Mason
local lsp_list = {
	"clangd",
	"cssls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"ts_ls",
	"yamlls",
	"zls",
}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = {}, -- Turn off an lsp if it pisses you off
	},
	ensure_installed = lsp_list,
})

for _, lsp in pairs(lsp_list) do
	vim.lsp.enable(lsp)
end

-- None.ls
local none_ls = require("null-ls")
none_ls.setup({
	sources = {
		-- Base + Lua
		none_ls.builtins.completion.spell,
		none_ls.builtins.formatting.stylua,
		-- Gdscript
		none_ls.builtins.diagnostics.gdlint,
		none_ls.builtins.formatting.gdformat,
		-- Web Package (Html + Css + Js)
		none_ls.builtins.formatting.prettier,
		-- Python
		none_ls.builtins.formatting.black,
		none_ls.builtins.formatting.isort,
	},
})

-- Theme
require("tokyonight").setup({
	transparent = true,
	terminal_colors = false,
})
vim.cmd(":colorscheme tokyonight-storm")

-- Colorizer
require("colorizer").setup({
	"*", -- Highlight all files, but customize some others.
	ghostty = { names = true },
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
})
