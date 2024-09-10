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
