require "nvchad.mappings"

-- add yours here
local nomap = vim.keymap.del
local map = vim.keymap.set

nomap("n", "<tab>")
nomap("n", "<s-tab>")
nomap("n", "<leader>b")

local function quit_with_check()
  local unsaved = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'modified') then
      unsaved = true
      break
    end
  end

  if unsaved then
    local choice = vim.fn.input('You have unsaved changes. Do you want to save? (y/n/c): ')
    if choice:lower() == 'y' then
      vim.cmd('wa!')
      vim.cmd('qa')
    elseif choice:lower() == 'n' then
      vim.cmd('qa!')
    else
      print('Cancelled')
    end
  else
    vim.cmd('qa')
  end
end

map("n", "<leader>wd", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" })
-- Map <leader>qq to the quit_with_check function
map("n", "<leader>qq", quit_with_check, { noremap = true, silent = true, desc = "Quit Neovim with check" })
-- map("n", "<leader>qq", ":qa<CR>", { noremap = true, silent = true, desc = "Quit Neovim" })
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

-- nvim-dap
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })


-- Move line up with Alt-k
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
-- map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move line up" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up" })

-- Move line down with Alt-j
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
-- map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
