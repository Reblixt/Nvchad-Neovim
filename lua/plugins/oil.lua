return {
	-- {
	-- 	-- I recommend not installing this a dependency of oil as it isn't required
	-- 	-- until you open an oil buffer
	-- 	"FerretDetective/oil-git-signs.nvim",
	-- 	ft = "oil",
	-- 	---@module "oil_git_signs"
	-- 	---@type oil_git_signs.Config
	-- 	opts = {},
	-- },
	{
		"stevearc/oil.nvim",
		-- enabled = false,
		lazy = false,

		---@module "oil"
		---@type oil.SetupOpts
		opts = {
			win_options = {
				signcolumn = "yes:2",
				statuscolumn = "",
			},
			columns = {
				"icon",
			},
		},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		vim.keymap.set("n", "<A-->", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory in floating window" }),
	},
}
