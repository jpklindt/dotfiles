return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
			end,
		})
	end,
	opts = {
		-- vim.ui.input → replaces dressing's input box
		input = { enabled = true },

		-- Snacks.picker: telescope-style floating list. ui_select = true takes over
		-- vim.ui.select (code-action menus etc.) — the half of dressing that `input` doesn't.
		-- picker = { enabled = true, ui_select = true },

		-- indent guides → replaces indent-blankline (keeps your ┊ char)
		indent = {
			enabled = true,
			-- indent = { char = "┊" },
			-- scope = { char = "┊" },
		},

		-- toast notifications for LSP / plugin messages (new capability)
		notifier = { enabled = true },

		-- don't freeze on huge files; render files before plugins attach (new capability)
		bigfile = { enabled = true },
		quickfile = { enabled = true },

		words = { enabled = true },

		-- scroll = { enabled = true },

		statuscolumn = { enabled = true },

		scratch = { enabled = true },

		zen = { enabled = true },
		dim = { enabled = true },

		toggle = { enabled = true },

		terminal = { enabled = true },

		explorer = { enabled = true },

		-- startup screen → replaces alpha.
		dashboard = {
			enabled = true,
			preset = {
				header = [[
			███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
			████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
			██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
			██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
			██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
			╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
				keys = {
					{ icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function()
							Snacks.picker.files()
						end,
					},
					{
						icon = " ",
						key = "s",
						desc = "Find Word",
						action = function()
							Snacks.picker.grep()
						end,
					},
					{
						icon = " ",
						key = "t",
						desc = "File Explorer",
						action = function()
							Snacks.explorer()
						end,
					},
					{ icon = "󰁯 ", key = "r", desc = "Restore Session", action = ":SessionRestore" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
	keys = {
		-- was: <cmd>LazyGit<cr> from lazygit.nvim
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open lazy git",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open line on GitHub",
			mode = { "n", "v" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git blame line",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen mode",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle scratch buffer",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle terminal",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle terminal",
		},
		-- {
		-- 	"<leader>ff",
		-- 	function()
		-- 		Snacks.picker.files()
		-- 	end,
		-- 	desc = "Find files",
		-- },
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent files",
		},
		-- {
		-- 	"<leader>fs",
		-- 	function()
		-- 		Snacks.picker.grep()
		-- 	end,
		-- 	desc = "Live grep",
		-- },
		-- {
		-- 	"<leader>fc",
		-- 	function()
		-- 		Snacks.picker.grep_word()
		-- 	end,
		-- 	desc = "Grep word",
		-- },
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo comments",
		},
		{
			"<leader>ee",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
		{
			"<leader>ef",
			function()
				Snacks.explorer.reveal()
			end,
			desc = "Explorer at file",
		},
	},
}
