local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  }
}

vim.keymap.set('n', '<leader>f', '<cmd>:Prettier<CR>')

-- autocmd for auto format
vim.g.auto_prettier = true

vim.keymap.set('n', '<leader>pe',
  '<cmd>lua vim.g.auto_prettier = true<CR><cmd>lua print("auto format with prettier `enabled`")<CR>'
)
vim.keymap.set('n', '<leader>pd',
  '<cmd>lua vim.g.auto_prettier = false<CR><cmd>lua print("auto format with prettier `disabled`")<CR>'
)
