-- lua/grant/python.lua
local home = os.getenv("HOME")
local venv_path = home .. "/.config/nvim/env/neovim-env/bin/python3"

-- Set the Python3 host program to use our virtual environment
vim.g.python3_host_prog = venv_path
-- Disable Python2 support as it's no longer needed
vim.g.loaded_python_provider = 0
