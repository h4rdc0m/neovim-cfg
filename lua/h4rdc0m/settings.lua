local global = vim.g
local o = vim.opt

-- Editor options
o.number = true -- Prints the line number
o.relativenumber = true -- Prints relative numbers
o.clipboard = "unnamedplus" -- Use system clipboard
o.syntax = "on" -- syntax highlighting
o.autoindent = true -- automatic indentation
o.cursorline = true -- highlight the line the cursor is on
o.expandtab = true -- In insert mode: Use the appropriate number of spaces to indent
o.shiftwidth = 2 -- Number of spaces to use for each step of indent
o.tabstop = 2 -- Number of spaces tha a <Tab> in the file counts for.
o.encoding = "UTF-8" -- Sets the character encoding used inside vim
o.ruler = true -- Show the line and column number of the cursor separately
o.mouse = "a" -- Enable the use of the mouse
o.title = true -- When enabled the title of the window will be set to `titlestring`
o.hidden = true -- A buffer will be hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in ms that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When `wildmenu` is on, command-line completion operates in an enhanced mode
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option to false if terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one
o.inccommand = "split" -- When non-empty, shows the effects of `:substitute`, `:smagic`, `:snomagic` and user commands with the `:command-preview` flag as you type
o.splitright = true
o.splitbelow = true
o.termguicolors = true
