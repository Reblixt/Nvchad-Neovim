-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
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
			theme = "default",
		},
	},
}

M.base46 = {
	theme = "catppuccin",
	transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

return M
