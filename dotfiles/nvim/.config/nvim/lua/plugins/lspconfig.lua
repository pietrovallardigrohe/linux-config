return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = true,
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"powershell_es",
				"taplo",
				"bashls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim" },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- vim.lsp.enable("lua_ls")
			-- vim.lsp.enable("ts_ls")
			-- vim.lsp.enable("powershell_es")
			-- vim.lsp.enable("taplo")
			-- vim.lsp.enable("bashls")
			-- vim.lsp.enable("wezterm-types")
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"prettier",
				"oxfmt",
				"stylua",
				"shfmt",
			},
		},
	},
}
