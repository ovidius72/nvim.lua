# Neovim from scratch

## Try out this config

Make sure to remove or move your current `nvim` directory

```
git clone git@github.com:ChristianChiarulli/Neovim-from-scratch.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 


each video will be associated with a branch so checkout the one you are interested in

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)
After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`
1. first
2. second
3. third


## Dependencies
1. eslint_d `npm i -g eslint_d`
1. jsonlint `npm i -g jsonlint`
1. stylelint `npm i -g stylelint`

