# RNvim

RNvim is the awesome, semi-optimised, easy to use, Neovim config brought to you
 by that guy that made RNvim, and here's why you shouldn't use it.

## Installation

```sh
git clone https://github.com/RoryNesbitt/RNvim ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## No Seriously..

RNvim is set up to be simple and make sense..to me.  
I seperated this out from my main dotfiles config because I find myself needing
 just this on more devices than I need everything. It is written completely
 with my needs in mind and that's unlikely to ever change. Even the installation
 commands are there so I can refrence them later.

Okay fine.  
If you choose to ignore me and use it anyway, keybindings are
 [here](lua/keybindings.lua), and if you forget, whichkey is included to provide
 a gentle reminder.  
Everything I bind myself starts with leader, which is set to space. Most things
 bound by plugins are left at default.
