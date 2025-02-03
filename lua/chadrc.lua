-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
	-- plugins = {
	-- 	override = {
	-- 		["nvim-telescope/telescope.nvim"] = {
	-- 			enabled = false,
	--
	-- 		},
	-- 	},
	-- },
	term = {
		hl = "Normal:term,WinSeparator:WinSeparator",
		sizes = { sp = 0.3, vsp = 0.2 },
		float = {
			relative = "editor",
			row = 0.06,
			col = 0.1,
			width = 0.8,
			height = 0.8,
			border = "rounded",
		},
	},

	-- 	load_on_startup = true,
	-- },

	-- nvconfig = {
	--
	-- },
	mason = {
		pkgs = {
			"eslint-lsp",
			"prettierd",
			"solhint",
			"nomicfoundation-solidity-language-server",
			"vtsls",
			"rust-analyzer",
			"tailwindcss-language-server",
			"codelldb",
			"css-lsp",
			"html-lsp",
		},
	},
	ui = {
		statusline = {
			theme = "minimal",
		},
		cmp = {
			lspkind_text = true,
			style = "default",
			format_colors = {
				tailwind = true,
				icons = true,
			},
		},
	},
}

M.base46 = {

	theme = "kanagawa",
	-- transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
		Bold = { bold = true },
	},
	hl_add = {
		-- Catppuccin
		-- ["@function.name.move"] = { fg = "#04a5e5" },
		-- ["@list.variable.move"] = { fg = "#bac2de" },
		-- ["@list.move"] = { fg = "#f38ba8" },
		-- ["@function.call.move"] = { fg = "#89b4fa" },
		--
		-- kanagawa
		["@include.member.move"] = { fg = "#89b4fa" },
		["@constructor.name.move"] = { fg = "#F9E2AF" }, --
		["@namespace.module.name.move"] = { fg = "#b4befe" },
		["@macro.call.move"] = { fg = "#C34043" },
		["@function.call.move"] = { fg = "#7E9CD8" },
		["@list.variable.move"] = { fg = "#DCD7BA" },

		["@list.move"] = { fg = "#E46876" },
	},
}

return M
