-- return {
-- 	"goolord/alpha-nvim",
-- 	dependencies = { "echasnovski/mini.icons" },
-- 	event = "VimEnter",
-- 	config = function()
-- 		require("alpha").setup(require("alpha.themes.startify").config)
-- 	end,
-- }
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		-- "catppuccin/nvim",
	},
	-- dependencies = { "echasnovski/mini.icons" },
	config = function()
		-- local mocha = require("catppuccin.palettes").get_palette("mocha") -- local colors = require("catppuccin").colors(),
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.bottom_buttons.val = {
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}
		dashboard.section.top_buttons.val = {
			dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("u", "󰊳 Update", ":Lazy update<CR>"),
			dashboard.button("c", " dotfiles", ":e ~/.config/nvim/<CR>"),
		}
		-- dashboard.file_icons.highlight = true
		dashboard.section.header.val = {
			[[                                                                               ]],
			[[                                                                               ]],
			[[                                                                               ]],
			[[                                                                               ]],
			[[                                                                             ]],
			[[               ████ ██████           █████      ██                     ]],
			[[              ███████████             █████                             ]],
			[[              █████████ ███████████████████ ███   ███████████   ]],
			[[             █████████  ███    █████████████ █████ ██████████████   ]],
			[[            █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[          ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[         ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                               ]],
			[[                                                                               ]],
			[[                                                                               ]],
		}

		-- dashboard.section.header.opts.hl = { fg = mocha.red }
		alpha.setup(dashboard.opts)
		dashboard.file_icons.provider = "devicons"
	end,
}

-- return {
-- 	"nvimdev/dashboard-nvim",
-- 	event = "VimEnter",
-- 	config = function()
-- 		require("dashboard").setup({
-- 			theme = "hyper",
-- 			config = {
-- 				week_header = {
-- 					enable = true,
-- 				},
-- 				shortcut = {
-- 					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
-- 					{
-- 						icon = " ",
-- 						icon_hl = "@variable",
-- 						desc = "Files",
-- 						group = "Label",
-- 						action = "Telescope find_files",
-- 						key = "f",
-- 					},
-- 					{
-- 						desc = " Apps",
-- 						group = "DiagnosticHint",
-- 						action = "Telescope app",
-- 						key = "a",
-- 					},
-- 					{
-- 						desc = " dotfiles",
-- 						group = "Number",
-- 						action = "e ~/.config/nvim/",
-- 						key = "c",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
-- }

--   {
-- 	"nvimdev/dashboard-nvim",
-- 	event = "VimEnter",
-- 	opts = function()
-- 		-- local logo = [[
-- 		--                                                     
-- 		--              ████ ██████           █████      ██
-- 		--             ███████████             █████ 
-- 		--             █████████ ███████████████████ ███   ███████████
-- 		--            █████████  ███    █████████████ █████ ██████████████
-- 		--           █████████ ██████████ █████████ █████ █████ ████ █████
-- 		--         ███████████ ███    ███ █████████ █████ █████ ████ █████
-- 		--        ██████  █████████████████████ ████ █████ █████ ████ ██████
-- 		--     ]]
--
-- 		-- logo = string.rep("\n", 8) .. logo .. "\n\n"
--
-- 		local opts = {
-- 			theme = "hyper",
-- 			hide = {
-- 				-- this is taken care of by lualine
-- 				-- enabling this messes up the actual laststatus setting after loading a file
-- 				statusline = false,
-- 			},
-- 			-- config = {
-- 			-- 	header = vim.split(logo, "\n"),
-- 			-- stylua: ignore
-- 			-- center = {
-- 			--   { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
-- 			--   { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
-- 			--   { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
-- 			--   { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
-- 			--   {
-- 			--     action = ":e ~/.config/nvim",
-- 			--     desc = " Config",
-- 			--     icon = " ",
-- 			--     key = "c"
-- 			--   },
-- 			--   { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
-- 			--   { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
-- 			--   { action = "qa", desc = " Quit", icon = " ", key = "q" },
-- 			-- },
-- 			-- 		footer = function()
-- 			-- 			local stats = require("lazy").stats()
-- 			-- 			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
-- 			-- 			return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
-- 			-- 		end,
-- 			-- 	},
-- 			-- }
-- 			--
-- 			-- for _, button in ipairs(opts.config.center) do
-- 			-- 	button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
-- 			-- 	button.key_format = "  %s"
-- 			-- end
-- 			--
-- 			-- -- close Lazy and re-open when the dashboard is ready
-- 			-- if vim.o.filetype == "lazy" then
-- 			-- 	vim.cmd.close()
-- 			-- 	vim.api.nvim_create_autocmd("User", {
-- 			-- 		pattern = "DashboardLoaded",
-- 			-- 		callback = function()
-- 			-- 			require("lazy").show()
-- 			-- 		end,
-- 			-- 	})
-- 		}
-- 		--
-- 		return opts
-- 	end,
-- }
