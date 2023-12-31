local status, null_ls = pcall(require, 'null-ls')
if not status then return end

local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
    formatting.clang_format,
    formatting.shfmt,
    --   diagnostics.eslint_d.with({
    --     diagnostics_format = '[eslint] #{m}\n(#{c})'
    --   })
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ sync = true })<CR>')

      vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup_format,
        buffer = 0,
        callback = function()
          vim.lsp.buf.format({ sync = true })
        end,
      })
    end
  end,
})
