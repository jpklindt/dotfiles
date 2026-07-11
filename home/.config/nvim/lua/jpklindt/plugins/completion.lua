return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*", -- use prebuilt fuzzy-matcher binary
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		completion = {
			list = { selection = { preselect = false, auto_insert = true } },
			documentation = { auto_show = true, auto_show_delay_ms = 300 },
			-- pairs nicely with nvim-autopairs? not needed — blink handles
			-- brackets on accept via 'accept.auto_brackets' (on by default)
		},
		appearance = { nerd_font_variant = "normal" },
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
		signature = { enabled = true },
	},
}
