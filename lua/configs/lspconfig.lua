-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
-- local on_attach = configs.on_attach
-- local on_init = configs.on_init
-- local capabilities = configs.capabilities
-- EXAMPLE
local servers = { "html", "cssls", "solidity_ls_nomicfoundation", "vtsls", "tailwindcss", "eslint" }
local nvlsp = require("nvchad.configs.lspconfig")
-- "rust_analyzer"
-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

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
