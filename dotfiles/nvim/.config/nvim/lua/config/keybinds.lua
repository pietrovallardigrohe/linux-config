-- Move the current line up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected section up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Replace in file
vim.keymap.set("n", "<leader>r", ":%s///g<Left><Left><Left>", {
	desc = "Replace in file",
})

-- Little one from Primeagen to mass replace string in a file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Disable space key
vim.keymap.set("n", "<leader>", "<nop>")

-- Remap as uppercase U
vim.keymap.set("n", "U", "<C-r>")

-- Save and quit faster
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { silent = false })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { silent = false })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = false })

