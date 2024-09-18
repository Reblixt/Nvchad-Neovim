return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- {
	--   "arnamak/stay-centered.nvim",
	--   event = "BufRead",
	--   lazy = false,
	--   enable = true,
	-- },

	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		lazy = true,
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = false,
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets" }),
	},
	-- lazy.nvim
	-- {
	-- 	"adelarsq/image_preview.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("image_preview").setup()
	-- 	end,
	-- },
}
