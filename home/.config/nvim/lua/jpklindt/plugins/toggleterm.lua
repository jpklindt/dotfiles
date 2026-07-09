return {
	-- amongst your other plugins
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
		},
		keys = {
			{
				"<leader>tt",
				"<cmd>ToggleTerm direction=float<cr>",
				desc = "Toggle terminal",
			},
		},
	},
}
