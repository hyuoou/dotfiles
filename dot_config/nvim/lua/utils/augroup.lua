local M = {}

M.userftkeymap = vim.api.nvim_create_augroup("UserFtKeymap", { clear = true })
M.userFormatting = vim.api.nvim_create_augroup("UserFormatting", { clear = true })

return M
