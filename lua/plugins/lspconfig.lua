return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		-- dependencies = { "saghen/blink.cmp" },
		-- opts = {
		-- 	servers = {
		-- 		lua_ls = {},
		-- 		vtsls = {},
		-- 		solidity_ls_nomicfoundation = {
		--
		-- 			filetypes = { "solidity" },
		-- 			-- root_dir = lspconfig.util.root_pattern(
		-- 			-- 	"hardhat.config.js",
		-- 			-- 	"hardhat.config.ts",
		-- 			-- 	"foundry.toml",
		-- 			-- 	"remappings.txt",
		-- 			-- 	"ape-config.yaml"
		-- 			-- ),
		-- 			single_file_support = true,
		-- 		},
		-- 	},
		-- },
		-- config = function(_, opts)
		-- 	local lspconfig = require("lspconfig")
		-- 	for server, config in pairs(opts.servers) do
		-- 		-- passing config.capabilities to blink.cmp merges with the capabilities in your
		-- 		-- `opts[server].capabilities, if you've defined it
		-- 		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		-- 		lspconfig[server].setup(config)
		-- 	end
		-- end,
		--
		config = function()
			require("configs.lspconfig")
		end,
	},
}
