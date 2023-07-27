# RNvim

RNvim is the awesome, semi-optimised, easy to use, Neovim config brought to you
by that guy that made RNvim, and here's why you shouldn't use it.

<a href="https://dotfyle.com/RoryNesbitt/rnvim"><img src="https://dotfyle.com/RoryNesbitt/rnvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/RoryNesbitt/rnvim"><img src="https://dotfyle.com/RoryNesbitt/rnvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/RoryNesbitt/rnvim"><img src="https://dotfyle.com/RoryNesbitt/rnvim/badges/plugin-manager?style=flat" /></a>

## No Seriously..

RNvim is set up to be simple and make sense..to me.  
I separated this from my main dotfiles config because I need just this on more
devices than I need everything. It is written completely with my needs in mind,
and that's unlikely to change. Even the installation commands are there so I can
reference them later.

If you choose to ignore me and use it anyway, keybindings are set
[here](lua/rnvim/keymaps.lua), and if you forget, whichkey is included to
provide a gentle reminder.  
Everything I bind myself starts with <kbd>leader</kbd> or
<kbd>localleader</kbd>, which are set to <kbd>space</kbd> and <kbd>,</kbd>
respectively. Most things bound by plugins are left at default.

## Installation

```sh
git clone https://github.com/RoryNesbitt/RNvim ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```
Language servers can be added with mason, the keybinding is
<kbd>\<leader\>m</kbd>

### A note on non-leader bindings

- Moving with <kbd>{</kbd>, <kbd>}</kbd>, <kbd>n</kbd> or <kbd>N</kbd> and
anything that results in being in insert mode is mapped to centre the line the
cursor is on.
- <kbd>hjkl</kbd> are used for all motions:
  - <kbd>Ctrl-hjkl</kbd> will jump between splits
  - <kbd>Alt-hjkl</kbd> will resize the split window
  - <kbd>Ctrl-Shift-hjkl</kbd> will move the split window that direction
    - Note: This requires the key press to be passed through in your terminal
  - `Visual` <kbd>Shift-hjkl</kbd> will move the highlighted line(s)
- <kbd>U</kbd> (upper-case) is used to redo, as e.g. <kbd>N</kbd> is the inverse
of <kbd>n</kbd>, <kbd>U</kbd> is now the inverse of <kbd>u</kbd>
- <kbd>gh</kbd>, for "GAHH", will release a little frustration from your code by
  changing to a random colourscheme
- <kbd>tb</kbd>, for transparent background, will remove the background colours
  from the colourscheme. Useful after a GAHH

## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:RoryNesbitt/RNvim ~/.config/RoryNesbitt/RNvim
NVIM_APPNAME=RoryNesbitt/RNvim/ nvim --headless +Lazy! sync +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=RoryNesbitt/RNvim/ nvim
```

## Plugins

<details>
<summary> Show list </summary>

### color

+ [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
### colorscheme

+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
### debugging

+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### editing-support

+ [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
+ [mrjones2014/nvim-ts-rainbow](https://dotfyle.com/plugins/mrjones2014/nvim-ts-rainbow)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [anuvyklack/hydra.nvim](https://dotfyle.com/plugins/anuvyklack/hydra.nvim)
+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [glepnir/lspsaga.nvim](https://dotfyle.com/plugins/glepnir/lspsaga.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### motion

+ [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)
### nvim-dev

+ [jbyuki/one-small-step-for-vimkind](https://dotfyle.com/plugins/jbyuki/one-small-step-for-vimkind)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
+ [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### startup

+ [glepnir/dashboard-nvim](https://dotfyle.com/plugins/glepnir/dashboard-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tmux

+ [aserowy/tmux.nvim](https://dotfyle.com/plugins/aserowy/tmux.nvim)
### utility

+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

This list was generated by [Dotfyle](https://dotfyle.com)

</details>
