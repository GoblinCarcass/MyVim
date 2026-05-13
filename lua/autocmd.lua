---@diagnostic disable: undefined-global

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.o.wrap = true
    vim.o.colorcolumn = "0"
	end,
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

