vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ZZ remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever (yank and paste without overwriting buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])
