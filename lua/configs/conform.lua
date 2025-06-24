local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		solidity = { "solhint" },
		css = { "biome-check" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		json = { "prettierd" },
		typescript = { "biome-check" },
		tsx = { "biome-check" },
		prisma = { "prisma-format" },
		http = { "prettierd" },
		toml = { "prettierd" },
		move = { "prettier-move" },
		python = { "black" },
		dockerfile = { "hadolint" },
		yaml = { "prettierd" },
		go = { "gofmt" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		cljfmt = {
			command = "cljfmt",
			args = { "fix", "$FILENAME" },
			stdin = false,
		},
		["prisma-format"] = {
			command = "npx prisma format",
			args = { "--stdin-filepath", "$FILENAME" },
			range_args = function(_, ctx)
				local util = require("conform.util")
				local lo, hi = util.get_offsets_from_range(ctx.buf, ctx.range)
				return {
					"--stdin-filepath",
					"$FILENAME",
					"--range-start=" .. lo,
					"--range-end=" .. hi,
				}
			end,
		},
		["prettier-move"] = {
			command = "prettier-move",
			args = { "--stdin-filepath", "$FILENAME" },
			range_args = function(_, ctx)
				local util = require("conform.util")
				local lo, hi = util.get_offsets_from_range(ctx.buf, ctx.range)
				return {
					"--stdin-filepath",
					"$FILENAME",
					"--range-start=" .. lo,
					"--range-end=" .. hi,
				}
			end,
		},
	},
}

return options
