return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		ft = { "rust" },

		-- lazy = true, -- This plugin is already lazy
		-- ["rust-analyzer"] = {
		-- 	procMacro = {
		-- 		ignored = {
		-- 			leptos_macro = {
		-- 				-- optional: --
		-- 				-- "component",
		-- 				"server",
		-- 			},
		-- 		},
		-- 	},
		-- 	cargo = {
		-- 		allfeatures = true,
		-- 	},
		-- },
		-- ft = { "rust" },
		-- dependencies = "neovim/nvim-lspconfig",
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
			-- map("n", "gd", "<cmd>lua vim.cmd('Telescope lsp_definitions')<CR>", { desc = "Go to definition" })
			-- map("n", "gt", "<cmd>lua vim.cmd('Telescope lsp_type_definitions')<CR>", { desc = "Go to type definition" })
			map(
				"n",
				"<leader>cd",
				"<cmd>lua vim.cmd('RustLsp renderDiagnostic')<CR>",
				{ desc = "Debugger hover actions" }
			)
			map("n", "<leader>ce", "<cmd>lua vim.cmd('RustLsp explainError')<CR>", { desc = "Explain Error" })
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
			-- 	map("n", "K", function()
			-- 		vim.cmd.RustLsp("hover", "actions")
			-- 	end, { silent = true, buffer = bufnr })
			-- 	-- or vim.lsp.buf.codeAction() if you don't want grouping.
			--
			-- local on_attach = require("lspconfig").on_attach
			-- local capabilities = require("lspconfig").capabilities
			-- vim.g.rustaceanvim = {
			-- 	-- settings = {
			-- 	--   ["rust-analyzer"] = {
			-- 	--     -- Other Settings ...
			-- 	--     procMacro = {
			-- 	--       ignored = {
			-- 	--         leptos_macro = {
			-- 	--           -- optional: --
			-- 	--           -- "component",
			-- 	--           "server",
			-- 	--         },
			-- 	--       },
			-- 	--     },
			-- 	--   },
			-- 	-- },
			-- 	tools = {},
			-- 	server = {
			-- 		-- on_attach = on_attach,
			-- 		-- capabilities = capabilities,
			-- 	},
			-- 	dap = {
			-- 		adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			-- 	},
			-- }
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
