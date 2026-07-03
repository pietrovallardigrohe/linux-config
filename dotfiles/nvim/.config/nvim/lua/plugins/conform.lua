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
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
			end, desc = "Format buffer",
		},
	},
}
