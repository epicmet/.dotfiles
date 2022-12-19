local status, notify = pcall(require, 'notify')
if not status then return end

notify.setup({
  timeout = 1500,
  fps = 360,
  top_down = true,
  stages = 'slide',
})

vim.notify = notify
