return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("configs.copilot")
	end,
}