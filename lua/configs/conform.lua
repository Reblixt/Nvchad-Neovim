local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    solidity = { "solhint" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    json = { "prettierd" },
    typescript = { "prettierd" },
    tsx = { "prettierd" },
    move = { "prettier-move" }
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
    ["prettier-move"] = {
      command = "prettier-move",
      args = { "--stdin-filepath", "$FILENAME" },
      range_args = function(_, ctx)
        local util = require "conform.util"
        local lo, hi = util.get_offsets_from_range(ctx.buf, ctx.range)
        return {
          "--stdin-filepath",
          "$FILENAME",
          "--range-start=" .. lo,
          "--range-end=" .. hi,
        }
      end,
    },
  }
}

return options
