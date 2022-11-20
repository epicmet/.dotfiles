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
vim.g.manual_prettier_autoformat_onsave = false

vim.keymap.set('n', '<leader>pe',
  '<cmd>lua vim.g.manual_prettier_autoformat_onsave = true<CR><cmd>lua vim.notify("manual auto-format with prettier is `enabled`")<CR>'
)
vim.keymap.set('n', '<leader>pd',
  '<cmd>lua vim.g.manual_prettier_autoformat_onsave = false<CR><cmd>lua vim.notify("manual auto-format with prettier is `disabled`")<CR>'
)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup('manual-prettier-autoformat', { clear = true }),
  pattern = {
    "*.ts",
    "*.tsx",
    "*.js",
    "*.cjs",
    "*.jsx",
    "*.html",
    "*.json",
    "*.md",
    "*.css",
    "*.scss",
    "*.yaml"
  },
  callback = function()
    if vim.g.manual_prettier_autoformat_onsave then
      vim.api.nvim_command("Prettier")
    end
  end
})
