return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			toml = { "oxfmt" },
			lua = { "stylua" },
			sh = { "shfmt" },
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			desc = "Format buffer",
		},
	},
}
