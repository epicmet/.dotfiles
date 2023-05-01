# Problem and solutions

## Persian font and emoji problem:

Installing `noto-fonts-emoji` and `ttf-dejavu` with pacman fixed it.

## Network and VIP GUI

Install `networkmanager` using pacman and use it instead of `iwctl`. Run `systemctl enable NetworkManager` so that it starts up on boot.
