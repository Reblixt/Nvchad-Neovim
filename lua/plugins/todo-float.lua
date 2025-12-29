return {
	"Reblixt/Todo.nvim",
	lazy = false,
	opts = {
		target_file = "~/notes/Todos.md",
	},
	keys = {
		{ "<leader>td", ":Td<CR>", "n", { noremap = true, silent = true } },
	},
}
