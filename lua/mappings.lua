require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<leader>qq", ":qa<CR>", { noremap = true, silent = true, desc = "Quit Neovim" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n", "t" }, "<A-t>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })


-- tabufline
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
-- local lazyterm = function()
--   LazyVim.terminal(nil, { cwd = LazyVim.root() })
-- end
-- map("n", "<M-t>", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<leader>fT", function()
--   LazyVim.terminal()
-- end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
-- map("t", "<M-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
