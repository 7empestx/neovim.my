-- Sets the leader key to the spacebar
vim.g.mapleader = " "

-- Escape current file and go to netrw
vim.keymap.set("n", "<leader>fj", vim.cmd.Ex)

-- In visual mode, moves the selected block one line down and reselects it
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- In visual mode, moves the selected block one line up and reselects it
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode, joins lines without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- In normal mode, scroll down with Control-d and reposition the cursor line to the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- In normal mode, scroll up with Control-u and reposition the cursor line to the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- In normal mode, navigate between search results, reposition the cursor line to the middle, and highlight the search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- In normal mode, start and stop the Vim With Me plugin
vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end)
vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end)

-- In visual mode, delete the current selection and paste the latest yanked text in its place
vim.keymap.set("x", "<leader>p", [["_dP]])

-- In normal and visual mode, yank the current line or selection into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- In normal and visual mode, paste the current line or selection into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- In normal and visual mode, delete the current line or selection without altering the unnamed register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- In insert mode, remaps Control-c to act as the escape key
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disables the 'Q' key in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- In normal mode, Control-f runs a shell command to open a new tmux window with a tmux-sessionizer session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- In normal mode, the leader key followed by 'f' runs a formatting function on the current buffer, probably using an installed LSP (Language Server Protocol)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- In normal mode, Control-k and Control-j navigate through the location list and recent commands, repositioning the screen each time so the cursor line is in the middle
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- In normal mode, the leader key followed by 'k' and 'j' navigate through the location list, repositioning the screen each time so the cursor line is in the middle
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- In normal mode, the leader key followed by 's' replaces the word under the cursor with itself (a no-op), and sets up the command line for additional typing of the replacement
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- In normal mode, the leader key followed by 'x' runs a shell command to make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- In normal mode, the leader key followed by 'vpp' opens a specific Lua file from a directory path
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/grant/packer.lua<CR>")

-- In normal mode, the leader key followed by 'mr' runs a CellularAutomaton function named "make_it_rain", which is probably a custom function
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- In normal mode, typing the leader key twice will reload the current Neovim configuration
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
