local opts = { noremap = true }

vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
vim.keymap.set("n", "<C-a>", "^", opts)
vim.keymap.set("n", "<C-e>", "$", opts)
vim.keymap.set("n", "<C-j>", "<Cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<Cmd>nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", "5<C-w><", opts)
vim.keymap.set("n", "<leader>j", "3<C-w>+", opts)
vim.keymap.set("n", "<leader>k", "3<C-w>-", opts)
vim.keymap.set("n", "<leader>l", "5<C-w>>", opts)

vim.keymap.set("i", "<C-a>", "<Home><S-Right>", opts)
vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set("v", "<C-a>", "^", opts)
vim.keymap.set("v", "<C-e>", "$", opts)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
vim.keymap.set("t", "jj", "<C-\\><C-n>", opts)
