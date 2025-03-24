return {
	{
		"christoomey/vim-tmux-navigator",
		event = "bufread",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-p>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- {
	-- 	"vimpostor/vim-tpipeline",
	-- 	event = "BufRead",
	-- 	-- lazy = false,
	-- 	config = function()
	-- 		vim.g.tpipeline_autoembed = 1
	-- 		vim.g.tpipeline_restore = 1
	-- 		vim.g.tpipeline_clearstl = 1
	-- 	end,
	-- },
}
