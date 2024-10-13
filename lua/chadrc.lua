-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
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

  -- nvdash = {
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
