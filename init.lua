vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

local api = vim.api

-- Create an autocommand group
local dash_group = api.nvim_create_augroup("DashboardGroup", { clear = true })

-- Create an autocommand
api.nvim_create_autocmd("VimEnter", {
	group = dash_group,
	callback = function()
		if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
			vim.cmd("Nvdash")
		end
	end,
})

vim.schedule(function()
	require("mappings")
end)

if vim.g.neovide then
	vim.o.guifont = "FiraCode Nerd Font:h12"
	vim.g.neovide_transparency = 0.75
	-- vim.g.transparency = 0.7
	vim.g.neovide_theme = "auto"
	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 0.5
	vim.g.neovide_scale_factor = 1.0
end
