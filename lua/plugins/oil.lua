return {
	"stevearc/oil.nvim",
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
}
