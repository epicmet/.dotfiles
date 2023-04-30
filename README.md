# My personal dotfiles 🤝

![workflow-screenshot](./.github/assets/workflow-screenshot.png)

I use vim btw. 😎

## Things you need to install before using these dotfiles

- Main:
  - [neovim](#neovim) (>=0.6)
  - [tmux](#tmux) (>=3.2)
  - [tree-sitter](#tree-sitter)
  - [zsh](#zsh)
  - [lua & luarocks](#lua)
  - [stow](#stow)
  - [fzf](#fzf) (>=0.23)
  - [yabai(on macOS)](#yabai)
- Tools:
  - [starship](https://starship.rs/)
  - [packer](#packer)
  - [tpm](https://github.com/tmux-plugins/tpm)
  - [prettierd](https://github.com/fsouza/prettierd)
  - [eslintd](https://github.com/mantoni/eslint_d.js)
  - [fd](https://github.com/sharkdp/fd)
  - [rg](https://github.com/BurntSushi/ripgrep)
  - [jq](#jq)
  - [gum](https://github.com/charmbracelet/gum)
  - [cfonts](#cfonts)
  - [z](#z)
  - [nala(on ubuntu)](https://gitlab.com/volian/nala/-/wikis/Installation)
  - [nerd font](#nerd-font)
  - [bat](https://github.com/sharkdp/bat)

## Usage

1. Clone this repo on your home directory.

2. Install all depenedencies based on instructions.

3. Then based on your platform run `./ubuntu` or `./macOS`. It would stow the dotfiles on your home directory.

## Actions

- After installing tpm, inside tmux use `prefix + I` to install tmux packages.
- After installing neovim and packer, use :PackerInstall to install neovim packages.

### neovim

On macOS, installing from brew should be fine. But on ubuntu if apt did not have version 0.6 or above by the time, you can use snippet below. [Source](https://www.codegrepper.com/code-examples/shell/ubuntu+install+neovim+0.6). OR maybe build it from the source ?

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

### tmux

On macOS, installing from brew should be fine. But on ubuntu if apt did not have version 3.2 or above by the time, follow the [instructions](https://github.com/tmux/tmux/wiki/Installing) to build it from source. Here is a quick summary:

1. Install these packages:

```bash
libevent-dev ncurses-dev build-essential bison pkg-config make automake autotools-dev bison autoconf
```

2. Go to /use/locals
3. Run snippet below:

```bash
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && sudo make install
```

### zsh

Install it from apt and then install oh-my-zsh, it will take care of everything.

### stow

Install from apt or brew.

### lua

If you have neovim installed, chances are you already have lua, also checkout this [site](https://lindevs.com/install-lua-from-source-code-on-ubuntu/), it will help you build lua from source.

### fzf

On macOS installing from brew should be fine but on ubuntu it's beter to clone from the [repo](https://github.com/junegunn/fzf) and run install script. Make sure you have `.fzf.zsh` in your home directory.

### packer

Follow the instructions in this [repo](https://github.com/wbthomason/packer.nvim) and install it.

### nerd-font

Dowload you desired font from this [repo](https://github.com/ryanoasis/nerd-fonts), otf versions are the best. "Caskaydia Cove Nerd Font" or "Fira Code Nerd Font" are suggested. Then install that font.

On arch linux after put the font in `/usr/share/fonts` and give it `444` chmod access (or give `555` to the containing folder). Refer to [this](https://wiki.archlinux.org/title/fonts) link.

### yabai

1. Install `yabai` and `skhd` via `homebrew`.

```bash
  brew install yabai
  brew install skhd
```

2. Start the service on background

```bash
  brew services start yabai
  brew services start skhd
```

Both of these should be running. Check their status with this command.

```bash
  brew services list
```

### z

1. clone the [repo](https://github.com/rupa/z) in `~/Software` dir.
2. run `chmod +rx ~/Software/z/z.sh`.

### cfonts

Install with `npm i -g cfonts`

### jq

Get the latest release from the [repo](https://github.com/stedolan/jq) and put it in `~/Software/bin`, then make it executable with `chmod` command.

### tree-sitter

Get the latest release form the [repo](https://github.com/tree-sitter/tree-sitter) and put it in `~/Software/bin`, then make it executable with `chmod` command.
