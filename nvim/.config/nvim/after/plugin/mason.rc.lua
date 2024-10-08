local status, mason = pcall(require, 'mason')
if not status then return end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then return end

local status3, mason_null_ls = pcall(require, 'mason-null-ls')
if not status3 then return end

mason.setup({})

mason_null_ls.setup({
  ensure_installed = {
    'prettier',
    'stylua',
    'jq',
    'shfmt',
    'buf',
    'jdtls',
    'clang-format',
    'phpactor',
    'mypy',
    'ruff',
    -- 'shellcheck',
    -- "eslint_d"
  },
})

lspconfig.setup({
  ensure_installed = {
    'ts_ls',
    'html',
    'cssls',
    'lua_ls',
    'tailwindcss',
    'rust_analyzer',
    'prismals',
    'gopls',
    'clangd',
    'pyright',
  },
})
