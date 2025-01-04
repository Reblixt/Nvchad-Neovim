require("nvchad.mappings")

-- add yours here
local nomap = vim.keymap.del
local map = vim.keymap.set

nomap("n", "<tab>")
nomap("n", "<s-tab>")
nomap("n", "<leader>b")
nomap("n", "<leader>x")

local function quit_with_check()
	local unsaved = false
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, "modified") then
			unsaved = true
			break
		end
	end

	if unsaved then
		local choice = vim.fn.input("You have unsaved changes. Do you want to save? (y/n/c): ")
		if choice:lower() == "y" then
			vim.cmd("wa!")
			vim.cmd("qa")
		elseif choice:lower() == "n" then
			vim.cmd("qa!")
		else
			print("Cancelled")
		end
	else
		vim.cmd("qa")
	end
end

map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- Map <leader>qq to the quit_with_check function
map("n", "<leader>qq", quit_with_check, { noremap = true, silent = true, desc = "Quit Neovim with check" })
map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr> <esc>")

-- Terminal mappings
map({ "n", "t" }, "<A-t>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
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
map("n", "<Leader>di", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>do", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
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
--- DapUI
map("n", "<Leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Debugger toggle" })
-- map("n", "<Leader>dl", "<cmd>lua require'dapui'.float_element('watches')<CR>", { desc = "Debugger toggle" })
-- map("n", "<Leader>dl", "<cmd>lua require'dapui'.eval()<CR>", { desc = "Debugger toggle" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover doc" })
-- map("n", "K", "<cmd>lua vim.cmd('RustLsp hover actions')<CR>", { desc = "Debugger hover actions" })

-- rustaceanvim
-- map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
-- map("n", "<Leader>ca", "<cmd>lua vim.cmd('RustLsp codeAction')<CR>", { desc = "Debugger codeAction" })
-- map("n", "<Leader>gp", "<cmd>lua vim.cmd('RustLsp parentModule')<CR>", { desc = "Go to ParentModule" })
-- 	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
-- end, { silent = true, buffer = bufnr })
--
-- map("n", "K", function()
-- 	vim.cmd.RustLsp("hover", "actions")
-- end, { silent = true, buffer = bufnr })
-- Move line up and down with Alt-j
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up" })
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })
map("n", "<leader>lw", "<cmd> set wrap! <CR>", { desc = "Toggle wrap" })

-- Indentation
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right" })
-- Yank without copying to system clipboard
-- map("v", "p", '"_dp', { noremap = true, silent = true, desc = "Paste without yanking" })

--- Diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Open diagnostics" })
map("n", "<leader>xx", vim.diagnostic.setloclist, { desc = "Open diagnostics in loclist" })
map("n", "<leader>xn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<leader>xh", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

-- Panel/Window management
map("n", "<leader>|", ":vsplit<CR>", { silent = true, desc = "Vertical split" })
map("n", "<leader>-", ":split<CR>", { silent = true, desc = "Horizontal split" })
map("n", "<leader>wd", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" })

vim.keymap.set("n", "<leader>io", function()
	local function get_image_path()
		-- Get the current line
		local line = vim.api.nvim_get_current_line()
		-- Pattern to match image path in Markdown
		local image_pattern = "%[.-%]%((.-)%)"
		-- Extract relative image path
		local _, _, image_path = string.find(line, image_pattern)

		return image_path
	end
	local image_path = get_image_path()

	if image_path then
		-- Check if the image path starts with "http" or "https"
		if string.sub(image_path, 1, 4) == "http" then
			print("URL image, use 'gx' to open it in the default browser.")
		else
			-- Construct absolute image path
			local current_file_path = vim.fn.expand("%:p:h")
			local absolute_image_path = current_file_path .. "/" .. image_path

			-- Construct command to open image in Preview
			local command = "open -a Preview " .. vim.fn.shellescape(absolute_image_path)
			-- Execute the command
			local success = os.execute(command)

			if success then
				print("Opened image in Preview: " .. absolute_image_path)
			else
				print("Failed to open image in Preview: " .. absolute_image_path)
			end
		end
	else
		print("No image found under the cursor")
	end
end, { desc = "[P](macOS) Open image under cursor in Preview" })
