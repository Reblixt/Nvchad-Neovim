-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

-- EXAMPLE
local servers = {
	"html",
	"cssls",
	-- "solidity_ls_nomicfoundation",
	"tailwindcss",
	"eslint",
	"slint_lsp",
	"markdown_oxide",
	"jsonls",
	"yamlls",
}
-- local nvlsp = require("nvchad.configs.lspconfig")
-- "rust_analyzer"
-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.move_analyzer.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "move" },
	cmd = { "move-analyzer" },
	root_dir = lspconfig.util.root_pattern("Move.toml"),
	single_file_support = true,
	--   -- settings = {
	--   --   move = {
	--   --     server = {
	--   --       command = "sui-move-analyzer",
	--   --       args = { "lsp" },
	--   --       filetypes = { "move" },
	--   --       root_dir = lspconfig.util.root_pattern("Move.toml"),
	--   --     },
	--   --   },
	--   -- },
})

lspconfig.solidity_ls_nomicfoundation.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "solidity" },
	root_dir = lspconfig.util.root_pattern(
		"hardhat.config.js",
		"hardhat.config.ts",
		"foundry.toml",
		"remappings.txt",
		"ape-config.yaml"
	),
	single_file_support = true,
})

lspconfig.denols.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

lspconfig.vtsls.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json"),
	single_file_support = false,
})
--
-- configuring single server, example: typescript
-- lspconfig.rust_analyzer.setup({
-- 	on_attach = nvlsp.on_attach,
-- 	on_init = nvlsp.on_init,
-- 	capabilities = nvlsp.capabilities,
-- 	settings = {
-- 		keybindings = {
-- 			goto_type_definition = "<leader>gd",
-- 		},
-- 	},
-- })
