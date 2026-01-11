-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Disable backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.showcmd = true

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = "onemore"
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = { tab = ">-", space = "·" }
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true

vim.opt.pumheight = 15
vim.opt.clipboard:append("unnamedplus")

-- Mouse option
vim.opt.mouse = ""

-- CursorHold time
vim.opt.updatetime = 100
