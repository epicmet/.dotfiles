return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require('notify')

    notify.setup({
      timeout = 1500,
      fps = 360,
      top_down = true,
      stages = 'slide',
    })

    -- https://github.com/neovim/nvim-lspconfig/issues/1931#issuecomment-1297599534
    local banned_messages = { 'No information available' }
    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then return end
      end
      return require('notify')(msg, ...)
    end
  end
}
