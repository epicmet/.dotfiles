# My personal dotfiles 🤝

![workflow-screenshot](./.github/assets/workflow-screenshot.png)

I use vim btw. 😎

## Things you need to install before using these dotfiles

- [neovim](#neovim) (>=0.6)
- [tmux](#tmux) (>=3.2)
- [zsh](#zsh)
- [oh my zsh](https://ohmyz.sh/)
- [stow](#stow)
- [lua & luarocks](#lua)
- [vim-plug](#vim-plug)
- [tpm](https://github.com/tmux-plugins/tpm)
- [fzf](#fzf) (>=0.23)
- [tmux-fzf](https://github.com/sainnhe/tmux-fzf)
- [nerd font](#nerd-font) (firaCode or dank mono)

## Usage
1. Clone this repo on your home directory.

2. Install all depenedencies based on instructions.

3. Then based on your platform run `./ubuntu` or `./macOS`. It would stow the dotfiles on your home directory.

## Actions

- After installing tpm, use `prefix I` to install tmux packages.
- After installing neovim and vim plug, use :PlugInstall to install neovim packages.

### neovim

On macOS, installing from brew should be fine. But on ubuntu if apt did not have version 0.6 or above by the time, you can use snippet below. [Source](https://www.codegrepper.com/code-examples/shell/ubuntu+install+neovim+0.6)

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

### tmux

On macOS, installing from brew should be fine. But on ubuntu if apt did not have version 3.2 or above by the time, follow the [instructions](https://github.com/tmux/tmux/wiki/Installing) to build it from source. Here is a quick summary:

1. Install these packages:

```bash
libevent-dev ncurses-dev build-essential bison pkg-config make automake autotools-dev bison
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

It is not really required at the moment. But in future if you used LSP or wanted to write your own plugins, checkout this [site](https://lindevs.com/install-lua-from-source-code-on-ubuntu/), it will help you build lua from source.

`note:` I hope I remember to edit this section when ever lua was really required :P

### fzf

On macOS installing from brew should be fine but on ubuntu it's beter to clone from the [repo](https://github.com/junegunn/fzf) and run install script.

### vim-plug

Go to the [repo](https://github.com/junegunn/vim-plug) and install the Neovim version.

### nerd-font

1. Go to the [repo](https://github.com/ryanoasis/nerd-fonts) and then from the fonts table choose a font. "Caskaydia Cove Nerd Font" or "Fira Code Nerd Font" are suggested.

2. In order to install click on the link for any font you chose. Generally it's something like: Go to Regular directory and find a complete directory and install the font on your system (otf versions are the best). OR follow the instruction on the readme of the font.

3. Change the font of your terminal to the font you installed.
