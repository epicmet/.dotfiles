local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.warn_about_missing_glyphs = false
config.hide_tab_bar_if_only_one_tab = true

return config
