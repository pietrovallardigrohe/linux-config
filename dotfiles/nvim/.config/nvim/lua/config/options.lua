----------------------------------------
--- General 
----------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.wrap = false

vim.opt.undofile = true

----------------------------------------
--- UI
----------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false

-- better completion
vim.opt.completeopt = {"menuone", "noselect"}

-- enable 24-bit colors
vim.opt.termguicolors = true

-- prevents the screen from jumping
vim.opt.signcolumn = "yes"

-- hightline current line number
vim.opt.cursorline = true

-- Always keeps lines above/bellow of current line
vim.opt.scrolloff = 8

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.lazyredraw = true

-- Highlight yank
vim.api.nvim_create_autocmd("textyankpost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 400, visual = true })
	end,
})

----------------------------------------
--- Search
----------------------------------------
-- enable hightlighting search
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})
