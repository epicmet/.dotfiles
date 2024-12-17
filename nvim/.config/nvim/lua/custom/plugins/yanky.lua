return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 100,
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      preserve_cursor_position = {
        enabled = true,
      },
    })

    vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)") -- To preserve cursor after yank

    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')

    vim.keymap.set('n', '<leader>n', '<Plug>(YankyCycleForward)')
    vim.keymap.set('n', '<leader>N', '<Plug>(YankyCycleBackward)')
  end
}
