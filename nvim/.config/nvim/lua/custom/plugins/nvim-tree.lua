return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  config = function()
    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close parent'))

      vim.keymap.set('n', 'l', function()
        local node = api.tree.get_node_under_cursor()
        if node then
          if node.type == 'file' then
            api.node.open.edit(node, { focus = false })
          elseif node.type == 'directory' then
            -- api.tree.change_root_to_node(node)
            api.node.open.edit(node)
          end
        end
      end, opts('Open child'))
    end

    require('nvim-tree').setup({
      on_attach = my_on_attach,
      filters = {
        git_ignored = false,
      },
    })

    vim.keymap.set('n', '<C-f>', '<cmd>NvimTreeToggle<CR>')
  end,
}
