-- return {
-- 	"eddyekofo94/gruvbox-flat.nvim",
-- 	priority = 1000,
-- 	enabled = true,
-- 	config = function()
-- 		vim.cmd([[colorscheme gruvbox-flat]])
-- 	end,
-- }
--

--return {
--	"sainnhe/gruvbox-material",
--	config = function()
--		vim.g.gruvbox_material_background = "soft"
--		vim.g.gruvbox_material_enable_italic = 1
--		vim.g.gruvbox_material_enable_bold = 1
--		vim.g.gruvbox_material_diagnostic_line_highlight = 1
--		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
--		vim.g.gruvbox_material_diagnostic_text_highlight = 1
--		vim.g.gruvbox_material_diagnostic_line_highlight = 1
--		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
--		vim.g.gruvbox_material_diagnostic_text_highlight = 1
--		vim.g.gruvbox_material_better_performance = 1
--		vim.g.gruvbox_material_palette = "mix"
--		vim.cmd([[colorscheme gruvbox-material]])
--	end,
-- }

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Daytime hours (24h). Outside this window uses the dark flavour.
			local day_start = 7
			local day_end = 19

			local function is_daytime()
				local hour = tonumber(os.date("%H"))
				return hour >= day_start and hour < day_end
			end

			-- Set light/dark based on time; catppuccin's `flavour = "auto"`
			-- follows vim.o.background and maps it via the `background` table.
			local function apply_time_of_day()
				local bg = is_daytime() and "light" or "dark"
				if vim.o.background ~= bg then
					vim.o.background = bg
				end
			end

			require("catppuccin").setup({
				flavour = "auto", -- follows vim.o.background: latte (day) / mocha (night)
				background = {
					light = "latte",
					dark = "mocha",
				},
				-- Mimicking your previous style preferences:
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

			apply_time_of_day()
			vim.cmd.colorscheme("catppuccin")

			-- Re-check every 5 minutes so it flips automatically if nvim
			-- stays open across the day/night boundary.
			local timer = vim.uv.new_timer()
			timer:start(5 * 60 * 1000, 5 * 60 * 1000, vim.schedule_wrap(apply_time_of_day))
		end,
	},
}
