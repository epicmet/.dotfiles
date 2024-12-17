return {
  "ThePrimeagen/harpoon",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    local harpoon = require('harpoon')

    local ui = require('harpoon.ui')

    local mark = require('harpoon.mark')

    harpoon.setup({
      menu = {
        width = 100,
      },
    })

    vim.keymap.set('n', '<leader>a', mark.add_file)
    vim.keymap.set('n', '<leader>v', ui.toggle_quick_menu)

    vim.keymap.set('n', '<leader>1', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<leader>2', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<leader>3', function()
      ui.nav_file(3)
    end)
    vim.keymap.set('n', '<leader>4', function()
      ui.nav_file(4)
    end)
    vim.keymap.set('n', '<leader>5', function()
      ui.nav_file(5)
    end)
    vim.keymap.set('n', '<leader>6', function()
      ui.nav_file(6)
    end)
    vim.keymap.set('n', '<leader>7', function()
      ui.nav_file(7)
    end)
    vim.keymap.set('n', '<leader>8', function()
      ui.nav_file(8)
    end)
    vim.keymap.set('n', '<leader>9', function()
      ui.nav_file(9)
    end)

    -- When harpoon2 is stable, use this config: (you may need to delete plugin first)
    -- local harpoon = require("harpoon")
    -- harpoon:setup()
    -- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    -- vim.keymap.set("n", "<leader>v", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    -- vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    -- vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
    -- vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
    -- vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
    -- vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
    -- vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
  end
}
