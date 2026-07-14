return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	-- for nixos:
	-- build = "nix run .#release",
	opts = {
		debug = {
			enabled = true,
			show_scores = true,
		},
	},
	lazy = false, -- the plugin lazy-initialises itself
	keys = {
		{
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"fg",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
		{
			"fc",
			function()
				require("fff").find_files_in_dir("~/dotfiles/home/.config/nvim")
			end,
			desc = "Find config files",
		},
		-- {
		-- 	"fr",
		-- 	function()
		-- 		local root = vim.fs.root(0, ".git") or vim.fn.getcwd()
		-- 		require("fff").find_files({ cwd = root })
		-- 	end,
		-- 	desc = "Find files in git root",
		-- },
		{
			"fz",
			function()
				require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
			end,
			desc = "Live fffuzy grep",
		},
		{
			"fw",
			function()
				require("fff").live_grep_under_cursor()
			end,
			mode = { "n", "x" },
			desc = "Search current word / selection",
		},
	},
}
