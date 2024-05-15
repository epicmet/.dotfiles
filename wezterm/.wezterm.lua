local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.warn_about_missing_glyphs = false

return config
