-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- -- local configs = require("nvchad.configs.lspconfig")
-- lspconfig.lua_ls.setup({
-- 	on_init = function(client)
-- 		if client.workspace_folders then
-- 			local path = client.workspace_folders[1].name
-- 			if
-- 				path ~= vim.fn.stdpath("config")
-- 				and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
-- 			then
-- 				return
-- 			end
-- 		end
--
-- 		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using
-- 				-- (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 			},
-- 			-- Make the server aware of Neovim runtime files
-- 			workspace = {
-- 				checkThirdParty = false,
-- 				library = {
-- 					vim.env.VIMRUNTIME,
-- 				},
-- 			},
-- 		})
-- 	end,
-- 	settings = {
-- 		Lua = {
-- 			hint = {
-- 				enable = true,
-- 			},
-- 		},
-- 	},
-- })

-- local original_capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

-- EXAMPLE
local servers = {
	lua_ls = {},
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
			-- "rust",
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
		root_dir = function(fname)
			-- Use the built-in root pattern function
			return require("lspconfig.util").root_pattern(
				"tailwind.config.js",
				"tailwind.config.cjs",
				"tailwind.config.mjs",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.cjs",
				"postcss.config.mjs",
				"postcss.config.ts"
			)(fname)
		end,
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
		root_markers = {
			"docker-compose.yml",
			"docker-compose.yaml",
		},
		-- root_dir = lspconfig.util.root_pattern('docker-compose.yml', 'docker-compose.yaml'),
	},
	dockerls = {
		filetypes = { "dockerfile" },
		root_markers = {
			"Dockerfile",
		},
		-- root_dir = lspconfig.util.root_pattern 'Dockerfile',
	},
	-- kulala_ls = {},
	move_analyzer = {
		filetypes = { "move" },
		cmd = { "move-analyzer" },
		root_markers = {
			"Move.toml",
		},
		single_file_support = true,
		settings = {
			move = {
				["inlay-hints"] = {
					param = true,
					type = true,
				},
			},
			["move-analyzer"] = {
				["inlay-hints"] = {
					param = true,
					type = true,
				},
			},
		},
	},

	solidity_ls = {
		cmd = { "vscode-solidity-server", "--stdio" },
		filetypes = { "solidity" },
		root_markers = {
			"hardhat.config.js",
			"hardhat.config.ts",
			"foundry.toml",
			"remappings.txt",
			"truffle.js",
			"truffle-config.js",
			"ape-config.yaml",
			".git",
			"package.json",
		},
		single_file_support = true,
	},

	solidity_ls_nomicfoundation = {
		cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
		filetypes = { "solidity" },
		root_markers = {
			"hardhat.config.js",
			"hardhat.config.ts",
			"foundry.toml",
			"remappings.txt",
			"truffle.js",
			"truffle-config.js",
			"ape-config.yaml",
			".git",
			"package.json",
		},
		single_file_support = true,
	},
	-- denols = {
	-- 	-- root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
	-- 	root_markers = {
	-- 		"deno.json",
	-- 		"deno.jsonc",
	-- 	},
	-- 	settings = {
	-- 		deno = {
	-- 			inlayHints = {
	-- 				parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
	-- 				parameterTypes = { enabled = true },
	-- 				variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
	-- 				propertyDeclarationTypes = { enabled = true },
	-- 				functionLikeReturnTypes = { enable = true },
	-- 				enumMemberValues = { enabled = true },
	-- 			},
	-- 		},
	-- 	},
	-- },
	vtsls = {
		root_markers = {
			"package.json",
		},
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

-- local servers = {
-- 	"solidity_ls_nomicfoundation",
-- 	"move_analyzer",
-- 	"lua_ls",
-- }

vim.lsp.enable(vim.tbl_keys(servers))
-- vim.lsp.enable("vtsls")
for name, opts in pairs(servers) do
	-- opts.on_init = configs.on_init
	-- opts.on_attach = configs.on_attach
	-- opts.capabilities = capabilities
	vim.lsp.config(name, opts)
	-- require("lspconfig")[name].setup(opts)
end
