return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim', -- This is needed for the 'mason-tool-installer' to find the lsps
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      'stevearc/conform.nvim',
      'b0o/SchemaStore.nvim',
    },
    config = function()
      local lspc = require('lspconfig')
      local mason = require('mason')
      local mti = require('mason-tool-installer')
      local conform = require('conform')
      local schemastore = require('schemastore')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = {
        lua_ls = true,
        ts_ls = {
          -- root_dir = lspc.util.root_pattern('package.json'),
          single_file_support = true,
        },
        jsonls = {
          settings = {
            json = {
              schemas = schemastore.json.schemas(),
              validate = { enable = true },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = '',
              },
              schemas = schemastore.yaml.schemas(),
            },
          },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local c = servers[key]
        if type(c) == 'table' then
          return not c.manual_install
        else
          return c
        end
      end, vim.tbl_keys(servers))

      mason.setup()
      local ensure_installed = {
        'stylua',
        'prettier',
      }

      vim.list_extend(ensure_installed, servers_to_install)
      mti.setup({ ensure_installed = ensure_installed })

      for name, config in pairs(servers) do
        if config == true then config = {} end
        config = vim.tbl_deep_extend('force', { capabilities = capabilities }, config)

        lspc[name].setup(config)
      end

      conform.setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          -- TODO: Create a proxy for every keymap,
          -- and add the keymap only if the lsp supports it.

          -- TODO: Many of these keymaps has a useful default behavior that I don't even know about!
          -- Read the Friendly manual!
          vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
          vim.keymap.set('n', '<leader>f', function()
            conform.format({ bufnr = 0, lsp_fallback = true, quiet = true })
          end, { buffer = 0 })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = 0 })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { buffer = 0 })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
          vim.keymap.set('n', 'S', vim.lsp.buf.signature_help, { buffer = 0 })
          vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { buffer = 0 })
          vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { buffer = 0 })

          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = 0 })
          vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { buffer = 0 })

          -- vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
          -- vim.keymap.set('n', 'gy', '<cmd>Telescope lsp_type_definitions<CR>', opts)
          -- vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
          -- vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                if vim.g.auto_format then
                  conform.format({
                    bufnr = args.buf,
                    lsp_fallback = true,
                    quiet = true,
                  })
                  -- vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end
              end,
            })
          end
        end,
      })
    end,
  },
}
