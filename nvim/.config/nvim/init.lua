require('custom.base')
require('custom.lazy') -- Lazy should be loaded after keymaps and base config

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = 'Hightlight when yanking',
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 50 })
  end
})
