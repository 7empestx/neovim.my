local tips = {
  "swap-window -s 6 -t 4  -- swap tmux windows",
  "Ctrl-b :  -- open tmux command prompt",
  "Ctrl-b d  -- detach from tmux session",
  "Ctrl-b c  -- create new tmux window",
  "Ctrl-b ,  -- rename tmux window",
  "Ctrl-b [  -- enter tmux copy mode",
  "Ctrl-b z  -- toggle tmux pane zoom",
  "Ctrl-b %  -- split tmux pane vertically",
  'Ctrl-b "  -- split tmux pane horizontally',
  "gl  -- open diagnostic float (nvim)",
  "gd  -- go to definition (nvim)",
  "K  -- hover documentation (nvim)",
  "<leader>pf  -- find files with telescope",
  "<leader>ps  -- grep with telescope",
  "Ctrl-a  -- harpoon add file",
  "Ctrl-e  -- harpoon toggle menu",
  "<leader>u  -- toggle undotree",
  "<leader>gs  -- open fugitive (git status)",
  "ciw  -- change inner word",
  "vi{  -- select inside braces",
  "%  -- jump to matching bracket",
  "Ctrl-o / Ctrl-i  -- jump back/forward in jumplist",
  "Ctrl-r  -- redo",
  "zz  -- center screen on cursor",
  ":noh  -- clear search highlights",
  "dap  -- delete a paragraph",
  "yap  -- yank a paragraph",
  "g;  -- go to last edit position",
  "Ctrl-w =  -- equalize split sizes",
  "qa ... q  -- record macro into register a, @a to replay",
}

local function show_tip()
  math.randomseed(os.time())
  local tip = tips[math.random(#tips)]

  local width = #tip + 4
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "  " .. tip .. "  " })

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    anchor = "NE",
    row = 1,
    col = vim.o.columns,
    width = width,
    height = 1,
    style = "minimal",
    border = "rounded",
    title = " Tip of the Day ",
    title_pos = "center",
  })

  vim.api.nvim_set_option_value("winhl", "Normal:NormalFloat,FloatBorder:FloatBorder", { win = win })

  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 5000)
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(show_tip, 100)
  end,
})
