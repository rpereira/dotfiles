# Rui's dotfiles

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/ruiafonsopereira/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

These are the base dotfiles I use when setting up a new environment. For private
configuration I use `.local` files, as described in the [Local Settings
section](https://github.com/ruiafonsopereira/dotfiles#local-settings).

![Screenshot of my shell prompt using Solarized Dark Theme](http://i.imgur.com/tyXR3p3.png)

## Installation

Just run the following command in your terminal.

### Via curl

```shell
sh -c "$(curl -fsSL \
  https://raw.githubusercontent.com/ruiafonsopereira/dotfiles/master/system/ubuntu/ubuntu.sh)"
```
### What is set up?
* [Solarized Dark](http://ethanschoonover.com/solarized) as the color scheme for
  terminal and Vim
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for
  finding things in files
* [Tmux](https://tmux.github.io/) for saving project state and switching between
  projects
* [Vim](http://www.vim.org/) as your core editor
* [Zsh](http://www.zsh.org/) as your shell


## Updating

Pull the latest changes and update modules.

    git pull && git submodule update --init --recursive

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

## Cheat sheet

[The cheat sheet](./docs/cheat-sheet.md) is intended as a reference
to _some_ Vim and tmux commands.

## Acknowledgements

Inspiration and some code was taken from several sources, including:
* [Chris Toomey](http://ctoomey.com/) and his [dotfiles repo](https://github.com/christoomey/dotfiles)
* [Paul Irish](http://www.paulirish.com/) and his [dotfiles repo](https://github.com/paulirish/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [dotfiles repo](https://github.com/thoughtbot/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [laptop setup](https://github.com/thoughtbot/laptop)

## License

These dotfiles are [MIT licensed](./LICENSE). Documentation is
[Creative Commons licensed](./LICENSE-docs).
