return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "c",
      "solidity",
      "typescript",
      "tsx",
      "javascript",
      "json",
      "rust",
      "markdown_inline",
      "yaml",
      "slint",
      "editorconfig",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "kconfig",
      "kdl",
      -- "move",
    },
    auto_install = true,
    highlight = {
      enable = true, -- Enable syntax highlighting
      additional_vim_regex_highlighting = false,
    },
  }
}
