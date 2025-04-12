-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.term = {
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
}

M.mason = {
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
}
M.ui = {
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
	-- tabufline = {
	-- 	hlgroup = {
	-- 		spacing = { bg = "#1F1F28", fg = "#1F1F28" },
	-- 	},
	-- },
}
M.base46 = {

	theme = "kanagawa",
	transparency = true,

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
		["@constructor.name.move"] = { fg = "#FFA066" },
		["@type.name.move"] = { fg = "#FFA066" },
		["@type.definition.struct.move"] = { fg = "#FFA066" },
		["@type.move"] = { fg = "#F4BB5C" },

		["@punctuation.special.move"] = { fg = "#FFA066" },
		["@punctuation.bracket.move"] = { fg = "#957FB8" },

		["@namespace.module.name.move"] = { fg = "#b4befe" },
		["@macro.call.move"] = { fg = "#C34043" },
		["@function.call.move"] = { fg = "#7E9CD8" },
		["@variable.special.move"] = { fg = "#E46876" },
		["@variable.parameter.move"] = { fg = "#E46876" },
		["@property.move"] = { fg = "#E46876" },
		["LspSignatureActiveParameter"] = { bg = "#3B4261", fg = "#bac3de" },

		-- ["@list.variable.move"] = { fg = "#DCD7BA" },
		-- ["@list.move"] = { fg = "#E46876" },
	},
}

return M
