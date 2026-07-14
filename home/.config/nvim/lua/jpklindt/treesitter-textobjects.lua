return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = { lookahead = true }, -- jump forward onto a textobject if cursor is before it
			move = { set_jumps = true }, -- record moves in the jumplist (<C-o>/<C-i>)
		})

		local select = require("nvim-treesitter-textobjects.select")
		local move = require("nvim-treesitter-textobjects.move")
		local swap = require("nvim-treesitter-textobjects.swap")

		-- SELECT: works with operators + visual, e.g. daf, cif, vac, cia
		local objects = {
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["ai"] = "@conditional.outer",
			["ii"] = "@conditional.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
		}
		for lhs, query in pairs(objects) do
			vim.keymap.set({ "x", "o" }, lhs, function()
				select.select_textobject(query, "textobjects")
			end, { desc = "Select " .. query })
		end

		-- MOVE: ]f/[f function, ]c/[c class, ]a/[a argument
		local nexts = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" }
		local prevs = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" }
		for lhs, query in pairs(nexts) do
			vim.keymap.set({ "n", "x", "o" }, lhs, function()
				move.goto_next_start(query, "textobjects")
			end, { desc = "Next " .. query })
		end
		for lhs, query in pairs(prevs) do
			vim.keymap.set({ "n", "x", "o" }, lhs, function()
				move.goto_previous_start(query, "textobjects")
			end, { desc = "Prev " .. query })
		end

		-- SWAP arguments (moved off <leader>a to avoid the harpoon conflict)
		vim.keymap.set("n", "<leader>na", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "Swap arg with next" })
		vim.keymap.set("n", "<leader>pa", function()
			swap.swap_previous("@parameter.inner")
		end, { desc = "Swap arg with previous" })
	end,
}
