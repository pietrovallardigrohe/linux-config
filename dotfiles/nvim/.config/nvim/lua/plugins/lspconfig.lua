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

			ensure_installed = {
				"lua_ls",
				"powershell_es",
				"taplo",
				"bashls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{
				"gD",
				vim.lsp.buf.declaration,
			},
			{
				"gd",
				vim.lsp.buf.definition,
			},
			{
				"gi",
				vim.lsp.buf.implementation,
			},
			{
				"K",
				vim.lsp.buf.hover,
			},
			{
				"<C-k>",
				vim.lsp.buf.signature_help,
			},
			{
				"<leader>wa",
				vim.lsp.buf.add_workspace_folder,
			},
			{
				"<leader>wr",
				vim.lsp.buf.remove_workspace_folder,
			},
			{
				"<leader>wl",
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
			},
			{
				"<leader>D",
				vim.lsp.buf.type_definition,
			},
			{
				"<leader>rn",
				vim.lsp.buf.rename,
			},
			{
				"<leader>ca",
				vim.lsp.buf.code_action,
				mode = { "n", "v" },
			},
			{
				"gr",
				vim.lsp.buf.references,
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("powershell_es")
			vim.lsp.enable("taplo")
			vim.lsp.enable("bashls")
			vim.lsp.enable("wezterm-types")
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
