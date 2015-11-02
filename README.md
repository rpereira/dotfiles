# Rui's dotfiles

These are the base dotfiles I use when setting up a new environment. For private
configuration I use `.local` files, as described in the [Local Settings
section](https://github.com/ruiafonsopereira/dotfiles#local-settings).

## Installation

Just run the following command in your terminal.

### Via curl

```shell
sh -c "$(curl -fsSL \
  https://raw.githubusercontent.com/ruiafonsopereira/dotfiles/master/ubuntu.sh)"
```
### What is set up?
* [Solarized Light](http://ethanschoonover.com/solarized) as the colorscheme for
  terminal and Vim
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for
  finding things in files
* [Tmux](https://tmux.github.io/) for saving project state and switching between
  projects
* [Vim](http://www.vim.org/) as your core editor
* [Zsh](http://www.zsh.org/) as your shell

## Local Settings
This configuration can be extended to suit additional user requirements. In
order to accomplish that, create and edit the following files:
* `~/.gitconfig.local`
* `~/.vimrc.local`
* `~/.vimrc_bundles.local`

If it exists in your `$HOME`, each of these files will be automatically included
at the bottom of its "parent". Thus, you can override existing configurations.

## Key bindings

The set of key bindings that come as default with this package are specified in
the [key
bindings](https://github.com/ruiafonsopereira/dotfiles/blob/master/key_bindings.md) file.

## Acknowledgements

Inspiration and some code was taken from several sources, including:
* [Thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles);
* [Thoughtbot's laptop setup](https://github.com/thoughtbot/laptop);
* [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles).

## License

See the
[LICENSE](https://github.com/ruiafonsopereira/dotfiles/blob/master/LICENSE.md) file for license rights and limitations (MIT).
