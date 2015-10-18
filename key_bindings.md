# Key bindings

*Discalimer: Some of the list bindings may not come as default with any VIM program
and thus are specified in ``vimrc`` and ``tmux.conf`` files provided in this
repository.*

The present file contains some of the vim and tmux key bindings that I've came
across along the time.

## VIM

### Cursor movement

In command mode.

#### Moving one character at a time

Key | Description
--- | ---
<kbd>h</kbd> | left one space
<kbd>l</kbd> | right one space
<kbd>j</kbd> | down one space
<kbd>k</kbd> | up one space

#### Moving among words and lines
Key | Description
--- | ---
<kbd>w</kbd> | Move the cursor forward one word
<kbd>b</kbd> | Move the cursor backward one word (if in the middle of a word, the cursor is moved to the beginning of the current word).
<kbd>e</kbd> | Move to the end of a word

**Note:** To build on this further, you can precede these commands with a number
for greater movement. For example, 5w would move you forward five words;
5j would move you down 5 characters.

#### Shortcuts
Key | Description
--- | ---
<kbd>0</kbd> | Move the cursor to the beginning of a line
<kbd>$</kbd> | Move the cursor to the end of a line

#### Screen movements
Key | Description
--- | ---
<kbd>Ctrl</kbd>-<kbd>f</kbd> | Scroll down one screen
<kbd>Ctrl</kbd>-<kbd>b</kbd> | Scroll up one screen
<kbd>H</kbd> | Move the cursor to the top line of the screen
<kbd>M</kbd> | Move the cursor to the middle line of the screen
<kbd>L</kbd> | Move the cursor to the last line of the screen
<kbd>1</kbd> <kbd>G</kbd> | Move to the beginning of the file
<kbd>G</kbd> | Move to the end of the file

#### Moving by searching
When you are in *command mode*, type a <kbd>/</kbd> followed the text to search
for. By pressing <kbd>Return</kbd>, the cursor will move to the first incidence
of that string of text. Then, you can move to the next occurrence using
<kbd>n</kbd>, and to the previous using <kbd>N</kbd>.

### Delete actions

Key | Description
--- | ---
<kbd>d</kbd> <kbd>w</kbd> | Delete from the current cursor position to the beginning of the next word character
<kbd>d</kbd> <kbd>$</kbd> or <kbd>D</kbd> | Delete from the current cursor position to the end of the current line

### Buffer actions


### File type specifics

Key | Description
--- | ---
<kbd>bd</kbd> <kbd>d</kbd> | Close the current buffer

### Code identation

Key | Description
--- | ---
<kbd>></kbd> <kbd>></kbd> | Ident 2 spaces to the right
<kbd><</kbd> <kbd><</kbd> | Ident 2 spaces to the left

#### CoffeeScript
Key | Description
--- | ---
<kbd>z</kbd> <kbd>i</kbd> | Toggle code foldeing per file.

