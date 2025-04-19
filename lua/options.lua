require("nvchad.options")
local opt = vim.opt
local o = vim.o
-- add yours here!

opt.spelllang = { "en" }
-- local o = vim.o
opt.scrolloff = 18

o.clipboard = "unnamedplus"
o.linebreak = true
o.wrap = false
o.relativenumber = true
o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.laststatus = 3

vim.cmd([[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]])
vim.cmd("AWStart")
-- NOTE: Ensures that when exiting NeoVim, Zellij returns to normal mode
vim.api.nvim_create_autocmd("VimLeave", {
	pattern = "*",
	command = "silent !zellij action switch-mode normal",
})
