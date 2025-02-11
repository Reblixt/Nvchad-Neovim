return {
	"stevearc/oil.nvim",
	-- enabled = false,
	lazy = false,
	-- config = function()
	-- 	return require("configs.oil")
	-- end,
	opts = {
		columns = {
			"icon",
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	vim.keymap.set("n", "<A-->", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory in floating window" }),
}
