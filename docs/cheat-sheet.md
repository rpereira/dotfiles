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
:---: | ---
<kbd>h</kbd> | move cursor left
<kbd>l</kbd> | move cursor right
<kbd>j</kbd> | move cursor down
<kbd>k</kbd> | move cursor up

#### Moving among words and lines
Key | Description
:-----------------------: | ---
<kbd>w</kbd >             | Jump forwards to the start of a word.
<kbd>W</kbd>              | Jump forwards to the start of a word (words can contain ponctuation).
<kbd>e</kbd>              | Jump forwards to the end of a word.
<kbd>E</kbd>              | Jump forwards to the end of a word (words can contain ponctuation).
<kbd>b</kbd>              | Jump backwards to the start of a word.
<kbd>b</kbd>              | Jump backwards to the start of a word (words can contain punctuation).
<kbd>0</kbd>              | Jump to the beginning of a line, including whitespace.
<kbd>^</kbd>              | Jump to the first non-whitespace character in the line.
<kbd>$</kbd>              | Jump to the end of a line.
<kbd>g</kbd> <kbd>g</kbd> | Jump to the beginning of the file.
<kbd>G</kbd>              | Jump to the end of the file.

**Note:** To build on this further, you can precede these commands with a number
for greater movement. For example, 5w would move you forward five words;
5j would move you down 5 characters.

#### Screen movements
Key | Description
:---: | ---
<kbd>Ctrl</kbd>-<kbd>e</kbd> | Scroll window lines downwards in the buffer. Mnemonic: Extra lines.
<kbd>Ctrl</kbd>-<kbd>f</kbd> | Scroll window pages Forwards (downwards) in the buffer.
<kbd>Ctrl</kbd>-<kbd>y</kbd> | Scroll window lines upwards in the buffer.
<kbd>Ctrl</kbd>-<kbd>b</kbd> | Scroll window pages Backwards (upwards) in the buffer.
<kbd>H</kbd> | Move the cursor to the top line of the screen
<kbd>M</kbd> | Move the cursor to the middle line of the screen
<kbd>L</kbd> | Move the cursor to the last line of the screen
<kbd>z</kbd> <kbd>z</kbd> | Center screen on the cursor, without moving the cursor.

#### Moving by searching
When you are in *command mode*, type a <kbd>/</kbd> followed the pattern to search
for. By pressing <kbd>Return</kbd>, the cursor will move to the first incidence
of that string of text. Then, you can move to the next occurrence using
<kbd>n</kbd>, and to the previous using <kbd>N</kbd>. You can also search backward for
pattern using `?pattern`.

#### Search and replace
Key | Description
:---: | ---
`:s/old/new` | Replace all old with new on the current line.
`:%s/old/new/g` | Replace all old with new throughout file.
`:%s/old/new/gc` | Replace all old with new throughout file with confirmations.

#### Insert mode: inserting and appending text
Key | Description
:---: | ---
<kbd>i</kbd> | Insert before the cursor.
<kbd>I</kbd> | Insert at the beginning of the line.
<kbd>a</kbd> | Insert (append) after the cursor.
<kbd>A</kbd> | Insert (append) at the end of the line.
<kbd>o</kbd> | Append (open) a new line below the current line.
<kbd>O</kbd> | Append (open) a new line above the current line.
<kbd>e</kbd> <kbd>a</kbd> | Insert (append) at the end of the word.
<kbd>Esc</kbd> | Exit insert mode.

### Editing

Key | Description
:---: | ---
<kbd>r</kbd> | Replace a single character
<kbd>J</kbd> | Join line below to the current one
<kbd>c</kbd> <kbd>c</kbd> | Change (replace) entire line
<kbd>c</kbd> <kbd>w</kbd> | Change (replace) to the end of the word
<kbd>c</kbd> <kbd>$</kbd> | Change (replace) to the end of the line
<kbd>s</kbd> | Delete character and substitute text
<kbd>S</kbd> | Delete line and substitute text (same as cc)
<kbd>x</kbd> <kbd>p</kbd> | Transpose two letters (delete and paste)
<kbd>u</kbd> | Undo
<kbd>Ctrl</kbd> + <kbd>r</kbd> | Redo
<kbd>.</kbd> | Repeat last command

### Cut and paste

Key | Description
:---: | ---
`yy`  | yank (copy) a line
`2yy` | yank (copy) 2 lines
`yw`  | yank (copy) word
`y$`  | yank (copy) to end of line
`p`   | put (paste) the clipboard after cursor
`P`   | put (paste) before cursor
`dd`  | delete (cut) a line
`2dd` | delete (cut) 2 lines
`dw`  | delete (cut) word
`D` or `d$` | delete (cut) to the end of the line
`x`   | delete (cut) character

### Marking text (visual mode)

Key | Description
:---: | ---
`v` | start visual mode, mark lines, then do a command (like y-yank)
`V` | start linewise visual mode
`o` | move to other end of marked area
<kbd>Ctrl</kbd> + <kbd>v</kbd> | start visual block mode
`O`  | move to other corner of block
`aw` | mark a word
`ab` | a block with ()
`aB` | a block with {}
`ib` | inner block with ()
`iB` | inner block with {}
<kbd>Esc</kbd> | exit visual mode

Some other visual commands are:

Key | Description
:---: | ---
<kbd>y</kbd> | yank (copy) marked text
<kbd>d</kbd> | delete marked text
<kbd>~</kbd> | switch case

### Buffer actions

Key | Description
:---: | ---
<kbd>bd</kbd> <kbd>d</kbd> | Close the current buffer

### Text identation

Key | Description
:---: | ---
<kbd>Tab</kbd> | Ident 2 spaces to the right
<kbd>Shift</kbd> + <kbd>Tab</kbd> | Ident 2 spaces to the left

In `normal mode`, you can ident a single line as described above. In order to change the identation of a block, you need to enter `visual mode` and then using the method described above. For instance, one can use <kbd>Ctrl</kbd> + <kbd>v</kbd> to enter visual mode, use <kbd>j</kbd> or <kbd>k</kbd> to select the lines, and then press <kbd>Tab</kbd> or <kbd>Shift</kbd> + <kbd>Tab</kbd> to fix the identation.

### Text wrapping

Text will be wrapped at 80 chars, except when editing git commit messages, where the text is wrapped at 72 chars.

`gqG` formats the text starting from the current position and to the end of the file. Thus, if you want to wrap the entire text on the file, move move to the start (`gg`) of the file before pressing `gqG`. This command will automatically join consecutive lines when possible, hence you should place a blank line between two lines if you don't want those two to be joined together. Also, in order to format a paragraph, move the cursor to its first line and then press `gq}`, or you can enter `visual mode` and then just type `gq`.

To futher expand on this, it's worth noting that it's also possible to use `gq` with any movement operators. For instance, one can just use `gq$` in order to format just the current line. 

### File type specifics

#### CoffeeScript
Key | Description
:---: | ---
<kbd>z</kbd> <kbd>i</kbd> | Toggle code foldeing per file.

### Exiting

Key | Description
:---: | ---
`:w` | Write (save) the file, but don't exit.
`:wq`, `:x` or `ZZ` | Write (save) and quit.
`:q` | Quit (fails if there are unsaved changes).
`:q!` or `ZQ` | Quit and throw away unsaved changes.

## tmux

### Prefix

All commands are preceded with the prefix <kbd>Ctrl</kbd> + <kbd>a</kbd>.

### Vim-style pane navigation
Key | Description
:---: | ---
<kbd>h</kbd> | Move one pane to the left
<kbd>j</kbd> | Move one pane down
<kbd>k</kbd> | Move one pane up
<kbd>l</kbd> | Move one pane to the right
