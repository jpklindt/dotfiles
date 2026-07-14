return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
		require("nvim-surround").setup({
			surrounds = {
				-- Markdown emphasis, ported from VSCode's <leader>rs+ / <leader>rs*
				["+"] = { add = { "_", "_" } }, -- italic  _text_
				["*"] = { add = { "__", "__" } }, -- bold    __text__
			},
		})

		local wrap = {
			["'"] = "'",
			['"'] = '"',
			["`"] = "`",
			["´"] = "`",
			["("] = ")",
			[")"] = ")",
			["["] = "]",
			["]"] = "]",
			["{"] = "}",
			["}"] = "}",
			["<"] = ">",
			[">"] = ">",
			["+"] = "+",
			["*"] = "*",
		}
		for lhs, rhs in pairs(wrap) do
			vim.keymap.set(
				"x",
				"<leader>rs" .. lhs,
				"S" .. rhs,
				{ remap = true, desc = "Surround selection with " .. lhs }
			)
		end
	end,
}
