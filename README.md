# Rui's dotfiles

Dotfiles for me. Here be draggons!

![Screenshot of my shell prompt](https://user-images.githubusercontent.com/3859158/68991197-01481e00-0854-11ea-91ae-bbbaa16d1779.png)

## What's in it?

* [Sensible macOS defaults](./system/macOS/defaults.sh), most of them taken from [mathiasbynens' dotfiles](https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.macos)
* My [bin](./bin), with lots of automation scripts
* [fzf](https://github.com/junegunn/fzf), which is an amazing command-line fuzzy finder
* A [git config](./git/gitconfig) and a bunch of [custom git commands](./bin) that improve my quality of life
* [neovim](https://github.com/neovim/neovim) as the core text editor. If you like vim, consider [helping children in Uganda](https://www.vim.org/sponsor/index.php)
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for
  finding things in files
* [tmux](https://tmux.github.io/) as a terminal multiplexer, useful for saving project state and switching between
  projects
* [zsh](http://www.zsh.org/) as the default shell with a vanilla setup and git in prompt
* Other tools can be found [here](./system/macOS/brew.sh)

## Installation

__Warning__: If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don't want or need. Don't blindly use settings provided here unless you understand them. Use at your own risk!

### macOS

1. Fork this repository
2. Run `./system/macOS/install.sh`

## License

dotfiles is copyright © 2015-present Rui Afonso Pereira. It is free software, and may be redistributed under the terms specified in the [LICENSE](./LICENSE) file.
