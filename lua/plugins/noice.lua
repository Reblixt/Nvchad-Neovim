return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- Inaktivera helt LSP-relaterade funktioner i Noice
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false,
				},
				-- Inaktivera signaturfunktionen
				signature = {
					enabled = false,
				},
				-- Inaktivera hover
				hover = {
					enabled = false,
				},
			},
			-- Inaktivera förhandsvisning av kommandon
			presets = {
				lsp_doc_border = false,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
}
