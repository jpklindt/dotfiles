return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
		local ts_pre_hook = ts_context_commentstring.create_pre_hook()

		comment.setup({
			pre_hook = function(ctx)
				local cstr = ts_pre_hook(ctx)
				if cstr then
					return cstr
				end

				if vim.treesitter.get_parser(0, nil, { error = false }) then
					return nil
				end

				return require("Comment.ft").get(vim.bo.filetype, ctx.ctype) or vim.bo.commentstring
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("commentstring_fallback", { clear = true }),
			callback = function(args)
				if vim.bo[args.buf].commentstring == "" then
					vim.bo[args.buf].commentstring = "# %s"
				end
			end,
		})
	end,
}
