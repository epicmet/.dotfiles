return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ft = 'markdown',
  config = function()
    local obs = require('obsidian')

    local vault_path = '~/Documents/obsidian-main-vault'

    obs.setup({
      legacy_commands = false, -- this will be removed in the next major release
      daily_notes = {
        enabled = true,
        folder = 'Daily',
      },
      workspaces = {
        {
          name = 'obsidian-main-vault',
          path = vault_path,
        },
      },
    })
  end,
}
