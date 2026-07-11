return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- the new branch does not support lazy-loading
	build = ":TSUpdate",
	config = function()
	local ensure_installed = {
		"json", "javascript", "java", "typescript", "tsx", "yaml", "html",
		"css", "prisma", "markdown", "markdown_inline", "svelte", "graphql",
		"bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc",
		"c", "sql", "python",
	}
	require("nvim-treesitter").install(ensure_installed)

	-- enable highlighting + indent per buffer (new API has no global toggle)
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
								callback = function(ev)
								local ok = pcall(vim.treesitter.start, ev.buf)
								if ok then
									vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
									end
									end,
	})
	end,
}

