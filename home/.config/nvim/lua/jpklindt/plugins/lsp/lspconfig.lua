-- ~/.config/nvim/lua/jpklindt/plugins/lsp/lspconfig.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"saghen/blink.cmp", -- if using nvim-cmp instead: "hrsh7th/cmp-nvim-lsp"
	},
	config = function()
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1 })
				end, opts)
				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1 })
				end, opts)
				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
			end,
		})

		-- diagnostic signs, new API (replaces the sign_define loop)
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = true,
			severity_sort = true,
		})

		-- capabilities for the completion engine
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- nvim-cmp variant:
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- defaults for every server
		vim.lsp.config("*", { capabilities = capabilities })

		-- per-server overrides (replaces the handlers table)
		vim.lsp.config("svelte", {
			on_attach = function(client, _)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})
		vim.lsp.config("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})
		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
				},
			},
		})

		-- mason-lspconfig v2: installs the list and calls vim.lsp.enable() for
		-- installed servers automatically (automatic_installation is gone)
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"dockerls",
				"jdtls",
				"pyright",
				"lua_ls",
				"remark_ls",
				"gradle_ls",
				"svelte",
				"graphql",
				"emmet_ls",
			},
		})
	end,
}
