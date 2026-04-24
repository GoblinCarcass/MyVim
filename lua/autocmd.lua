---@diagnostic disable: undefined-global

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.o.wrap = true
		require("wrapping").hard_wrap_mode()
		vim.cmd("<CR>")
	end,
})
