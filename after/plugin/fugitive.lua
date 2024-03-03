vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, {});
vim.keymap.set("n", "<leader>gb", require("telescope.builtin").git_branches, {});
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits, {});
vim.keymap.set("n", "<leader>gd", require("telescope.builtin").git_bcommits, {});
vim.keymap.set("n", "<leader>gl", require("telescope.builtin").git_status, {});
