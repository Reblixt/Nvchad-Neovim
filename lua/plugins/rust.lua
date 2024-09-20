return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		["rust-analyzer"] = {
			cargo = {
				allfeatures = true,
			},
		},
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			local cfg = require("rustaceanvim.config")
			local map = vim.keymap.set
			map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
			map("n", "<Leader>ca", "<cmd>lua vim.cmd('RustLsp codeAction')<CR>", { desc = "Debugger codeAction" })
			map("n", "<Leader>cr", "<cmd>lua vim.cmd('vim.lsp.buf.rename()')<CR>", { desc = "Rename" })
			map("n", "<Leader>gp", "<cmd>lua vim.cmd('RustLsp parentModule')<CR>", { desc = "Go to ParentModule" })
			map("n", "gd", "<cmd>lua vim.cmd('Telescope lsp_definitions')<CR>", { desc = "Go to definition" })
			map("n", "gt", "<cmd>lua vim.cmd('Telescope lsp_type_definitions')<CR>", { desc = "Go to type definition" })
			map("n", "K", "<cmd>lua vim.cmd('RustLsp hover actions')<CR>", { desc = "Debugger hover actions" })
			map("n", "<leader>xe", "<cmd>lua vim.cmd('RustLsp explainError')<CR>", { desc = "Explain Error" })
			-- 	map("n", "K", function()
			-- 		vim.cmd.RustLsp("hover", "actions")
			-- 	end, { silent = true, buffer = bufnr })
			-- 	-- or vim.lsp.buf.codeAction() if you don't want grouping.
			--
			-- local on_attach = require("lspconfig").on_attach
			-- local capabilities = require("lspconfig").capabilities
			vim.g.rustaceanvim = {
				tools = {},
				server = {
					-- on_attach = on_attach,
					-- capabilities = capabilities,
				},
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},

	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}
