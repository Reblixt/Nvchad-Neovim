return {
	"olimorris/codecompanion.nvim",
	event = "BufRead",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	-- `adapters.<adapter_name>` and `adapters.opts` is deprecated, use `adapters.http.<adapter_name>` and `adapters.http.opts` instead.
	-- Feature will be removed in CodeCompanion v18.0.0
	opts = {

		-- General settings
		display = {
			diff = {
				enabled = true,
				close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
				layout = "vertical", -- vertical|horizontal split for default provider
				opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
				provider = "mini_diff", -- default|mini_diff
			},
			chat = {
				intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
				show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
				separator = "─", -- The separator between the different messages in the chat buffer
				show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
				show_settings = false, -- Show LLM settings at the top of the chat buffer?
				show_token_count = true, -- Show the token count for each response?
				start_in_insert_mode = false, -- Open the chat buffer in insert mode?
			},
		},

		-- extensions
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					show_result_in_chat = true, -- Show mcp tool results in chat
					make_vars = true, -- Convert resources to #variables
					make_slash_commands = true, -- Add prompts as /slash commands
				},
			},
		},

		--- Strategies
		strategies = {
			chat = {
				adapter = "gemini",
				tools = {
					-- ["mcp"] = {
					-- 	callback = require("mcphub.extensions.codecompanion"),
					-- 	description = "Call tools and resources from the MCP Servers",
					-- 	opts = {
					-- 		user_approval = true,
					-- 	},
					-- },
					["next_edit_suggestion"] = {
						opts = {
							--- the default is to open in a new tab, and reuse existing tabs
							--- where possible
							---@type string|fun(path: string):integer?
							jump_action = "tabnew",
						},
					},
				},
			},
			inline = {
				adapter = "gemini",
				keymaps = {
					accept_change = {
						modes = { n = "ga" },
						description = "Accept the suggested change",
					},
					reject_change = {
						modes = { n = "gr" },
						description = "Reject the suggested change",
					},
				},
			},
		},

		--- Adapters
		adapters = {
			http = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = {
							api_key = os.getenv("GOOGLE_AI_API_KEY"),
						},
						model = "schema.model.default",
					})
				end,
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
	},
}
