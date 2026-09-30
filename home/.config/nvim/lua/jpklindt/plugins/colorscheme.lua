return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local day_start = 7
			local day_end = 19
			local function apply_background(bg)
				if vim.o.background ~= bg then
					vim.o.background = bg
				end
			end

			local function clock_background()
				local hour = tonumber(os.date("%H"))
				return (hour >= day_start and hour < day_end) and "light" or "dark"
			end

			local function sync_background()
				if vim.env.TMUX then
					vim.system({ "tmux", "show", "-gv", "@catppuccin_flavor" }, { text = true }, function(out)
						local flavor = vim.trim(out.stdout or "")
						local bg = (flavor == "latte") and "light" or (flavor ~= "" and "dark") or clock_background()
						vim.schedule(function()
							apply_background(bg)
						end)
					end)
				else
					apply_background(clock_background())
				end
			end

			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
				no_italic = false,
				no_bold = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
				},
			})

			sync_background()
			vim.cmd.colorscheme("catppuccin")

			local timer = vim.uv.new_timer()
			timer:start(5 * 60 * 1000, 5 * 60 * 1000, vim.schedule_wrap(sync_background))
		end,
	},
}
