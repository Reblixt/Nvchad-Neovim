return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
			"moyiz/blink-emoji.nvim",
			"MahanRahmati/blink-nerdfont.nvim",
			-- "Kaiser-Yang/blink-cmp-avante",
			{
				"xzbdmw/colorful-menu.nvim",
				opts = {
					ls = {
						lua_ls = {
							-- Maybe you want to dim arguments a bit.
							arguments_hl = "@comment",
						},
						-- for lsp_config or typescript-tools
						-- ts_ls = {
						-- 	-- false means do not include any extra info,
						-- 	-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
						-- 	extra_info_hl = "@comment",
						-- },
						vtsls = {
							-- false means do not include any extra info,
							-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
							extra_info_hl = "@comment",
						},
						clangd = {
							-- Such as "From <stdio.h>".
							extra_info_hl = "@comment",
							-- Similar to the same setting of gopls.
							align_type_to_right = true,
							-- the hl group of leading dot of "•std::filesystem::permissions(..)"
							import_dot_hl = "@comment",
							-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
							preserve_type_when_truncate = true,
						},
						-- If true, try to highlight "not supported" languages.
						fallback = true,
						-- this will be applied to label description for unsupport languages
						fallback_extra_info_hl = "@comment",
					},
					-- If the built-in logic fails to find a suitable highlight group for a label,
					-- this highlight is applied to the label.
					fallback_highlight = "@variable",
					max_width = 60,
				},
			},
			-- { "echasnovski/mini.icons", opts = {} },
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "enter",
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-n>"] = { "snippet_forward", "fallback" },
				["<C-p>"] = { "snippet_backward", "fallback" },
				["<Up>"] = {},
				["<Down>"] = {},
				-- ["<C-k>"] = {},
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
				["<C-f>"] = { "scroll_documentation_up", "fallback" },
				["<C-b>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},
			signature = {
				enabled = true,
				-- window = {
				-- 	show_documentation = true,
				-- },
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				documentation = { auto_show = true },
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
							kind_icon = {
								text = function(ctx)
									local lspkind = require("lspkind")
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = lspkind.symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
				ghost_text = {
					enabled = false,
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lazydev", "lsp", "snippets", "path", "buffer", "emoji", "nerdfont" },
				providers = {
					-- avante = {
					--                     module = 'blink-cmp-avante',
					--                     name = 'Avante',
					--                     opts = {
					--                         -- options for blink-cmp-avante
					--                     }
					--                 }
					nerdfont = {
						module = "blink-nerdfont",
						name = "Nerd Fonts",
						score_offset = 15, -- Tune by preference
						opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
						should_show_items = function()
							return vim.tbl_contains(
								-- Enable emoji completion only for git commits and markdown.
								-- By default, enabled for all file-types.
								{ "gitcommit", "markdown", "typescript" },
								vim.o.filetype
							)
						end,
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15, -- Tune by preference
						opts = { insert = true },
						should_show_items = function()
							return vim.tbl_contains(
								-- Enable emoji completion only for git commits and markdown.
								-- By default, enabled for all file-types.
								{ "gitcommit", "markdown", "typescript" },
								vim.o.filetype
							)
						end,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					buffer = {
						opts = {
							get_bufnrs = function()
								return vim.tbl_filter(function(bufnr)
									return vim.bo[bufnr].buftype == ""
								end, vim.api.nvim_list_bufs())
							end,
						},
					},
				},
			},
			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"exact",
					-- defaults
					"score",
					"sort_text",
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
