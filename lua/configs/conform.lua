local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    solidity = { "solhint" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    json = { "prettierd" },
    typescript = { "prettierd" },
    tsx = { "prettierd" }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
