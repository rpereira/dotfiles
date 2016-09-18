# Rui's dotfiles

These are the base dotfiles I use when setting up a new environment. For private
configuration I use `.local` files, as described in the [Local Settings
section](https://github.com/ruiafonsopereira/dotfiles#local-settings).

![Screenshot of my shell prompt using Solarized Dark Theme](http://i.imgur.com/tyXR3p3.png)

## Installation

### macOS

1. Create an SSH key and add it to your GitHub account
2. Clone this repository
3. Run `./system/macOS/install.sh`

### Ubuntu

```shell
sh -c "$(curl -fsSL \
  https://raw.githubusercontent.com/ruiafonsopereira/dotfiles/master/system/ubuntu/ubuntu.sh)"
```

### Running tests

Execute `./scripts/run_tests.sh` to run the full test suit. This will report if
something went wrong during the installation process.

### What is set up?
* [Solarized Dark](http://ethanschoonover.com/solarized) as the color scheme for
  terminal and Vim
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for
  finding things in files
* [Tmux](https://tmux.github.io/) for saving project state and switching between
  projects
* [Vim](http://www.vim.org/) as your core editor
* [Zsh](http://www.zsh.org/) as your shell

## Getting Updates
In order to update this repository just pull the latest changes.

    git pull

You can update your machine using `mac update`. _See `man mac` for more
options._

## Local Settings
This configuration can be extended or overridden to suit user-specific
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

## Acknowledgments

Inspiration and some code was taken from several sources, including:
* [Chris Toomey](http://ctoomey.com/) and his [dotfiles repo](https://github.com/christoomey/dotfiles)
* [Paul Irish](http://www.paulirish.com/) and his [dotfiles repo](https://github.com/paulirish/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [dotfiles repo](https://github.com/thoughtbot/dotfiles)
* [Thoughtbot](https://thoughtbot.com/) and their [laptop setup](https://github.com/thoughtbot/laptop)

## License

These dotfiles are [MIT licensed](./LICENSE). Documentation is
[Creative Commons licensed](./LICENSE-docs).
