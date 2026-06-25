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
			require("catppuccin").setup({
				flavour = "mocha", -- options: latte, frappe, macchiato, mocha
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

			-- Load the colorscheme
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
