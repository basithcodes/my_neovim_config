vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 7

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.wrap = true

vim.o.undofile = true

vim.wo.signcolumn = 'yes'

--vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.api.nvim_command('set conceallevel=3')

