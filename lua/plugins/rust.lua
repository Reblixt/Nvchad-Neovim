return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				server = {
					settings = {
						["rust-analyzer"] = {
							inlayHints = {
								bindingModeHints = {
									enable = false,
								},
								chainingHints = {
									enable = true,
								},
								closingBraceHints = {
									enable = true,
									minLines = 25,
								},
								closureReturnTypeHints = {
									enable = "never",
								},
								lifetimeElisionHints = {
									enable = "never",
									useParameterNames = false,
								},
								maxLength = 25,
								parameterHints = {
									enable = true,
								},
								reborrowHints = {
									enable = "never",
								},
								renderColons = true,
								typeHints = {
									enable = true,
									hideClosureInitialization = false,
									hideNamedConstructor = false,
								},
							},
						},
					},
				},
			}
		end,

		config = function()
			-- local mason_registry = require("mason-registry")
			-- local codelldb = mason_registry.get_package("codelldb")
			-- local extension_path = codelldb:get_install_path() .. "/extension/"
			-- local codelldb_path = extension_path .. "adapter/codelldb"
			-- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			-- local cfg = require("rustaceanvim.config")
			local map = vim.keymap.set
			map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
			map("n", "<Leader>ca", "<cmd>lua vim.cmd('RustLsp codeAction')<CR>", { desc = "Debugger codeAction" })
			map("n", "<Leader>cr", "<cmd>lua vim.cmd('vim.lsp.buf.rename()')<CR>", { desc = "Rename" })
			map("n", "<Leader>gp", "<cmd>lua vim.cmd('RustLsp parentModule')<CR>", { desc = "Go to ParentModule" })
			map(
				"n",
				"<leader>cd",
				"<cmd>lua vim.cmd('RustLsp renderDiagnostic')<CR>",
				{ desc = "Debugger hover actions" }
			)
			map("n", "<leader>ce", function()
				vim.cmd.RustLsp({ "explainError", "current" })
			end)
			map(
				"n",
				"<leader>xe",
				"<cmd>lua vim.cmd.RustLsp({ 'explainError', 'cycle' })<CR>",
				{ desc = "Cycle Error" }
			)
			map(
				"n",
				"<leader>xd",
				"<cmd>lua vim.cmd.RustLsp('relatedDiagnostics')<CR>",
				{ desc = "Related Diagnostics" }
			)
			map("n", "K", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end)
		end,
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				lsp = {
					enabled = true,
					-- on_attach = function(client, bufnr)
					-- 	-- the same on_attach function as for your other lsp's
					-- end,
					actions = true,
					completion = true,
					hover = true,
				},
				completion = {
					enabled = true,
				},
			})
		end,
	},
}
