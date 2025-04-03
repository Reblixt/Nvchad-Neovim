-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
-- local configs = require("nvchad.configs.lspconfig")

local original_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

require("lspconfig").lua_ls.setup({
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
-- EXAMPLE
local servers = {
	html = {},
	cssls = {},
	tailwindcss = {},
	eslint = {},
	slint_lsp = {},
	markdown_oxide = {},
	jsonls = {},
	yamlls = {},
	move_analyzer = {
		filetypes = { "move" },
		cmd = { "move-analyzer" },
		root_dir = lspconfig.util.root_pattern("Move.toml"),
		single_file_support = true,
	},
	solidity_ls_nomicfoundation = {
		filetypes = { "solidity" },
		root_dir = lspconfig.util.root_pattern(
			"hardhat.config.js",
			"hardhat.config.ts",
			"foundry.toml",
			"remappings.txt",
			"ape-config.yaml"
		),
		single_file_support = true,
	},
	denols = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	},
	vtsls = {
		root_dir = lspconfig.util.root_pattern("package.json"),
		single_file_support = false,
	},
}
for name, opts in pairs(servers) do
	-- opts.on_init = configs.on_init
	-- opts.on_attach = configs.on_attach
	opts.capabilities = capabilities
	require("lspconfig")[name].setup(opts)
end

-- lspconfig.denols.setup({
--   on_init = configs.on_init,
--   on_attach = configs.on_attach,
--   capabilities = configs.capabilities,
--   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
-- })
-- --
-- lspconfig.vtsls.setup({
--   on_init = configs.on_init,
--   on_attach = configs.on_attach,
--   capabilities = configs.capabilities,
--   root_dir = lspconfig.util.root_pattern("package.json"),
--   single_file_support = false,
-- })
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
