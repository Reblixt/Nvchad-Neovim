local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		solidity = { "forge_fmt" }, -- Change to forge_fmt
		-- css = { "biome" },
		css = { "prettierd" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		json = { "prettierd" },
		typescript = function(bufnr)
			local buf_path = vim.api.nvim_buf_get_name(bufnr)
			if buf_path == "" then
				return { "prettierd" }
			end

			-- Look for biome.json or biome.jsonc in project root
			local root = vim.fs.find({ "biome.json", "biome.jsonc", "package.json", ".git" }, {
				path = vim.fs.dirname(buf_path),
				upward = true,
			})[1]

			if root then
				local root_dir = vim.fs.dirname(root)
				local has_biome_config = vim.uv.fs_stat(vim.fs.joinpath(root_dir, "biome.json"))
					or vim.uv.fs_stat(vim.fs.joinpath(root_dir, "biome.jsonc"))

				if has_biome_config then
					return { "biome" }
				end
			end

			return { "prettierd" }
		end,
		tsx = function(bufnr)
			-- Reuse the same logic as typescript
			return require("conform").formatters_by_ft.typescript(bufnr)
		end,
		-- typescript = { "biome" },
		-- tsx = { "biome" },
		prisma = { "prisma-format" },
		http = { "prettierd" },
		toml = { "taplo" },
		move = { "prettier-move" },
		python = { "black" },
		dockerfile = { "hadolint" },
		yaml = { "prettierd" },
		go = { "gofmt" },
		nix = { "nixfmt" },
		rust = function(bufnr)
			local buf_path = vim.api.nvim_buf_get_name(bufnr)
			if buf_path == "" then
				return { "rustfmt" }
			end

			local root_markers = { "Dioxus.toml", "Cargo.toml", ".git" }
			local project_root = vim.fs.find(root_markers, {
				path = vim.fs.dirname(buf_path),
				upward = true,
			})[1]

			if project_root then
				local root_dir = vim.fs.dirname(project_root)
				local dioxus_toml = vim.fs.joinpath(root_dir, "Dioxus.toml")
				if vim.uv.fs_stat(dioxus_toml) then
					return { "rustfmt", "dx-fmt" }
				end
			end
			return { "rustfmt" }
		end,
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
		["forge_fmt"] = {
			command = "forge",
			args = { "fmt", "$FILENAME" },
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
		["dx-fmt"] = {
			command = "dx",
			args = { "fmt", "-f", "$FILENAME" },
			stdin = false,
			cwd = require("conform.util").root_file({ "Dioxus.toml" }),
		},
	},
}

return options
