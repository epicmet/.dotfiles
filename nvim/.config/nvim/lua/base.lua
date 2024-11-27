vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.rnu = true

vim.opt.title = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10

vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'

vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.infercase = true -- Case insensitive autocomplete
vim.opt.smartcase = true

vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append({ '**' }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ '*/node_modules/*' })
vim.opt.mouse = nil

vim.g.mapleader = ' '
vim.g.skip_ts_context_commentstring_module = true
vim.g.auto_prettier_format_onsave = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.updatetime = 50

vim.opt.clipboard:append({ 'unnamedplus' }) -- Sync yank registry with clipboard

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 50 })
  end,
})

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste',
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ 'r' })
-- Colorscheme
-- vim.cmd('colorscheme base16-tomorrow-night')
vim.cmd('colorscheme base16-ashes')
