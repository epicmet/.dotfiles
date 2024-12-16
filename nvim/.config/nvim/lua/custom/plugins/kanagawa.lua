return {
  "rebelot/kanagawa.nvim",
  config = function()
    require('kanagawa').setup({
      compile = true,   -- enable compiling the colorscheme to lua bytecode
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      theme = "dragon",      -- Default when 'background' option is not set
      background = {         -- map the value of 'background' option to a theme
        dark = "dragon",     -- Options: "dragon", "wave"
        light = "lotus"
      },
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
    })

    -- Make sure to run :KanagawaCompile if you edited the config

    vim.cmd("colorscheme kanagawa")
  end
}
