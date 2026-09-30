return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "--unique --noraise file:@pdf#src:@line@tex"
		vim.g.vimtex_quickfix_open_on_warning = 0
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "VimtexEventCompileSuccess",
		-- 	callback = function()
		-- 		vim.cmd("VimtexView")
		-- 		local has_errors = false
		-- 		for _, item in ipairs(vim.fn.getqflist()) do
		-- 			if item.type == "E" then
		-- 				has_errors = true
		-- 				break
		-- 			end
		-- 		end
		-- 		if not has_errors then
		-- 			vim.cmd("cclose")
		-- 		end
		-- 	end,
		-- })
	end,
}
