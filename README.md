# RNvim

RNvim is the awesome, semi-optimised, easy to use, Neovim config brought to you
by that guy that made RNvim, and here's why you shouldn't use it.

## No Seriously..

RNvim is set up to be simple and make sense..to me.  
I separated this from my main dotfiles config because I need just this on more
devices than I need everything. It is written completely with my needs in mind,
and that's unlikely to change. Even the installation commands are there so I can
reference them later.

If you choose to ignore me and use it anyway, keybindings are set
[here](lua/keybindings.lua), and if you forget, whichkey is included to provide
a gentle reminder.  
Everything I bind myself starts with <kbd>leader</kbd>, which is set to <kbd>space</kbd>. Most things
bound by plugins are left at default.

## Installation

```sh
git clone https://github.com/RoryNesbitt/RNvim ~/.config/nvim
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
```
Language servers can be added with mason, the keybinding is
<kbd>\<leader\>m</kbd>

### A note on non-leader bindings

- Moving with <kbd>{</kbd>, <kbd>}</kbd>, <kbd>n</kbd> or <kbd>N</kbd> and
anything that results in being in insert mode is mapped to center the line the
cursor is on.
- <kbd>hjkl</kbd> are used for all motions:
  - <kbd>Ctrl-hjkl</kbd> will jump between splits
  - <kbd>Alt-hjkl</kbd> will resize the split window
  - <kbd>Ctrl-Shift-hjkl</kbd> will move the split window that direction
    - Note: This requires the keypress to be passed through in your terminal
  - `Visual` <kbd>Shift-hjkl</kbd> will move the highlighted line(s)
- <kbd>U</kbd> (uppercase) is used to redo, as e.g. <kbd>N</kbd> is the inverse
of <kbd>n</kbd>, <kbd>U</kbd> is now the inverse of <kbd>u</kbd>
- <kbd>gh</kbd>, for "GAHH", will release a little frustration from your code by
  changing to a random colourscheme
- <kbd>tb</kbd>, for transparent background, will remove the background colours
  from the colourscheme. Useful after a GAHH
