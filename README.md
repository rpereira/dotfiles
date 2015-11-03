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
This configuration can be extended or overriden to suit user-specific
requirements. In order to accomplish that, just create and edit the following
files:
* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.vimrc_bundles.local`

If it exists in your `$HOME`, each of these files will be automatically
included.

## Key bindings

The set of key bindings that come as default with this package are specified in
the [key
bindings](https://github.com/ruiafonsopereira/dotfiles/blob/master/key_bindings.md) file.

## Acknowledgements

Inspiration and some code was taken from several sources, including:
* [Thoughtbot](https://thoughtbot.com/) and their [dotfiles repo](https://github.com/thoughtbot/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [laptop setup](https://github.com/thoughtbot/laptop)
* [Paul Irish](http://www.paulirish.com/) and his [dotfiles repo](https://github.com/paulirish/dotfiles)

## License

See the
[LICENSE](https://github.com/ruiafonsopereira/dotfiles/blob/master/LICENSE.md) file for license rights and limitations (MIT).
