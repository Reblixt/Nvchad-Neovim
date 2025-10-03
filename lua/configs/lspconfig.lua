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
		Lua = {
			hint = {
				enable = true,
			},
		},
	},
})
-- EXAMPLE
local servers = {
	pyright = {},
	gopls = {},
	html = {},
	cssls = {},
	nil_ls = {},
	-- rnix = {
	-- 	filetypes = { "nix" },
	-- },
	tailwindcss = {
		filetypes = {
			-- html
			"aspnetcorerazor",
			"astro",
			"astro-markdown",
			"blade",
			"clojure",
			"django-html",
			"htmldjango",
			"edge",
			"eelixir", -- vim ft
			"elixir",
			"ejs",
			"erb",
			"eruby", -- vim ft
			"gohtml",
			"gohtmltmpl",
			"haml",
			"handlebars",
			"hbs",
			"html",
			"htmlangular",
			"html-eex",
			"heex",
			"jade",
			"leaf",
			"liquid",
			"markdown",
			"mdx",
			"mustache",
			"njk",
			"nunjucks",
			"php",
			"razor",
			"slim",
			"twig",
			-- css
			"css",
			"less",
			"postcss",
			"sass",
			"scss",
			"stylus",
			"sugarss",
			-- js
			"javascript",
			"javascriptreact",
			"reason",
			"rescript",
			"typescript",
			"typescriptreact",
			-- mixed
			"vue",
			"svelte",
			"templ",
			"rust",
		},
		settings = {
			tailwindCSS = {
				includeLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
					templ = "html",
					htmlangular = "html",
					rust = "html",
				},
				experimental = {
					-- 			classRegex = { 'class\\s*:\\s*"([^"]*)' },
					classRegex = { 'class: "(.*)"' },
				},
			},
		},
	},
	eslint = {},
	slint_lsp = {},
	markdown_oxide = {},
	-- vscode_css_language_server = {},
	prismals = {},
	jsonls = {},
	yamlls = {},
	docker_compose_language_service = {
		filetypes = { "yaml.docker_compose" },
		root_dir = lspconfig.util.root_pattern("docker-compose.yml", "docker-compose.yaml"),
	},
	dockerls = {
		filetypes = { "dockerfile" },
		root_dir = lspconfig.util.root_pattern("Dockerfile"),
	},
	kulala_ls = {},
	move_analyzer = {
		filetypes = { "move" },
		cmd = { "move-analyzer" },
		root_dir = lspconfig.util.root_pattern("Move.toml"),
		single_file_support = true,
		settings = {
			["move-analyzer"] = {
				inlayHints = {
					typeHints = {
						enable = true,
					},
					parameterHints = {
						enable = true,
					},
				},
			},
		},
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
		settings = {
			deno = {
				inlayHints = {
					parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
					parameterTypes = { enabled = true },
					variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enable = true },
					enumMemberValues = { enabled = true },
				},
			},
		},
	},
	vtsls = {
		root_dir = lspconfig.util.root_pattern("package.json"),
		single_file_support = false,
		settings = {
			typescript = {
				inlayHints = {
					parameterNames = { enabled = "all" },
					parameterTypes = { enabled = true },
					variableTypes = { enabled = true },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
					enumMemberValues = { enabled = true },
				},
			},
		},
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
