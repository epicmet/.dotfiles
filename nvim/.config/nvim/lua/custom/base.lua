vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.clipboard = 'unnamedplus' -- Sync yank registry with clipboard

vim.opt.ignorecase = true         -- Case insensitive searching UNLESS /C or capital in search
vim.opt.infercase = true          -- Case insensitive autocomplete
vim.opt.smartcase = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shell = 'zsh'

-- Remove default behavior of space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>")
vim.keymap.set("v", "<leader>x", ":.lua<CR>")

vim.g.auto_format = true
local function toggle_auto_format_handler()
  vim.g.auto_format = not vim.g.auto_format
  print('Auto format on save ' .. (tostring(vim.g.auto_format)))
end
vim.keymap.set('n', '<leader>tf', toggle_auto_format_handler)

-- Do not yank things deleted with x
vim.keymap.set('n', 'x', '"_x')

-- Move lines
vim.keymap.set('v', 'J', ":m '>+1 <CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2 <CR>gv=gv")

-- Cursor stays on its position on J
vim.keymap.set('n', 'J', 'mzJ`z')

-- Put cursor on the center when navigating with Ctrl-u and Ctrl-d
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- When paste on visual mode, do not replace the deleted thing with the yank register
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete to void register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Split tab window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Quickfix list
vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>qo', '<cmd>copen<CR>')
vim.keymap.set('n', '<leader>qq', '<cmd>cclose<CR>')
