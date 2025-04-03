return {
	"olimorris/codecompanion.nvim",
	event = "BufRead",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = {
				tools = {
					["mcp"] = {
						callback = function()
							return require("mcphub.extensions.codecompanion")
						end,
						description = "Call tools and resources from the MCP Servers",
					},
				},
				adapter = "deepseek",
			},
			inline = {
				adapter = "anthropic",
			},
		},
		adapters = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = os.getenv("ANTHROPIC_API_KEY"),
					},
				})
			end,
			deepseek = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "deepseek-8b", -- Give this adapter a different name to differentiate it from the default ollama adapter
					schema = {
						model = {
							default = "deepseek-r1:8b",
						},
						num_ctx = {
							default = 16384,
						},
						num_predict = {
							default = -1,
						},
					},
				})
			end,
			gemma = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "gemma-4b", -- Give this adapter a different name to differentiate it from the default ollama adapter
					schema = {
						model = {
							default = "gemma3:4b",
						},
						num_ctx = {
							default = 16384,
						},
						num_predict = {
							default = -1,
						},
					},
				})
			end,
		},
	},
}
