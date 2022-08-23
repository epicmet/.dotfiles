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

vim.keymap.set('n', '<leader>pe', '<cmd>lua vim.g.auto_prettier = true<CR>')
vim.keymap.set('n', '<leader>pd', '<cmd>lua vim.g.auto_prettier = false<CR>')

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup('ts-js-prettier-formater', { clear = true }),
  pattern = {
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx",
    "*.html",
    "*.json",
    "*.md",
    "*.css",
    "*.scss",
    "*.yaml"
  },
  callback = function()
    if vim.g.auto_prettier then
      vim.api.nvim_command("Prettier<CR>")
    end
  end
})
