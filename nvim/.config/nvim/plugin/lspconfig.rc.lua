--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local rt_status, rt = pcall(require, 'rust-tools')
if not rt_status then return end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- stylua: ignore
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- stylua: ignore
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>Telescope lsp_type_definitions<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

  buf_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- formatting
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = vim.api.nvim_create_augroup('Format', { clear = true }),
  --     buffer = bufnr,
  --     callback = function()
  --       if vim.lsp.buf.format then
  --         vim.lsp.buf.format({ sync = true })
  --       elseif vim.lsp.buf.formatting then
  --         vim.lsp.buf.formatting()
  --       end
  --     end,
  --   })
  -- end
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.denols.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc'),
})

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  cmd = { 'typescript-language-server', '--stdio' },
  root_dir = nvim_lsp.util.root_pattern('package.json'),
  single_file_support = true,
  capabilities = capabilities,
})

nvim_lsp.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.sourcekit.setup({
  on_attach = on_attach,
})

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
})

nvim_lsp.tailwindcss.setup({})

nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.cssls.setup({
  cmd = { 'vscode-css-language-server', '--stdio' },
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.prismals.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- nvim_lsp.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

rt.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = '●' },
  severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
})
