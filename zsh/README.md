# zsh-config
My personal oh-my-zsh configuration.

## Adding another customization directory
In your ``~/.zshrc`` file just change the path of ``$ZSH_CUSTOM`` to a directory of your own liking:

```bash
ZSH_CUSTOM=~/repos/zsh-config
```

## Setting another ``source`` file:
In your ``~/.zshrc`` file locate the line containing ``source $ZSH/oh-my-zsh.sh`` and immediately after it add the path to the custom source file:
```bash
source $ZSH_CUSTOM/rap.zsh
```

## Enabling the theme
In your ``~/.zshrc`` just change the ``$ZSH_THEME`` to ``rap``:

```bash
ZSH_THEME="rap"
```

## Setting up Solarized Light Colorscheme for Gnome Terminal
You should take a look at [gnome-terminal-colors-solarized](https://github.com/Anthony25/gnome-terminal-colors-solarized).

1. Clone the repo mentioned above: ``git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git .gnome-terminal-colors-solarized.git``
2. Navigate to the target folder and just execute ``./set_light``.
