# Rui's dotfiles

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/ruiafonsopereira/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

These are the base dotfiles I use when setting up a new environment. For private
configuration I use `.local` files, as described in the [Local Settings
section](https://github.com/ruiafonsopereira/dotfiles#local-settings).

![image](https://cloud.githubusercontent.com/assets/3859158/11144772/2fabb750-89f7-11e5-9f25-7813f3af4b64.png)

## Installation

Just run the following command in your terminal.

### Via curl

```shell
sh -c "$(curl -fsSL \
  https://raw.githubusercontent.com/ruiafonsopereira/dotfiles/master/system/ubuntu/ubuntu.sh)"
```
### What is set up?
* [Solarized Light](http://ethanschoonover.com/solarized) as the colorscheme for
  terminal and Vim
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for
  finding things in files
* [Tmux](https://tmux.github.io/) for saving project state and switching between
  projects
* [Vim](http://www.vim.org/) as your core editor on Ubuntu;
    [MacVim](https://github.com/macvim-dev/macvim) if you're on OS X
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

## Key bindings

The set of key bindings that come as default with this package are specified in
the [key
bindings](https://github.com/ruiafonsopereira/dotfiles/blob/master/key_bindings.md) file.

## Acknowledgements

Inspiration and some code was taken from several sources, including:
* [Chris Toomey](http://ctoomey.com/) and his [dotfiles repo](https://github.com/christoomey/dotfiles)
* [Paul Irish](http://www.paulirish.com/) and his [dotfiles repo](https://github.com/paulirish/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [dotfiles repo](https://github.com/thoughtbot/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [laptop setup](https://github.com/thoughtbot/laptop)

## License

See the
[LICENSE](https://github.com/ruiafonsopereira/dotfiles/blob/master/LICENSE.md) file for license rights and limitations (MIT).
