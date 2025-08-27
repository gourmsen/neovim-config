-- overview
--
-- b: buffers
-- d: definition
-- e: errors
-- f: files
-- g: grep
-- j: next hunk
-- k: previous hunk
-- m: split/join
-- o: aerial outline
-- p: prettier
-- r: references
-- s: stage hunk
-- t: tree
-- u: undo stage hunk

-- lsp
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references)

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>g", builtin.live_grep)

-- trouble
vim.keymap.set("n", "<leader>e", "<cmd>Trouble diagnostics toggle<cr>")

-- tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- gitsigns
vim.keymap.set({ "n", "v" }, "<leader>s", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>u", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "<leader>j", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "<leader>k", ":Gitsigns prev_hunk<CR>")

-- treesj
vim.keymap.set("n", "<leader>m", require("treesj").toggle)

-- aerial
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")

-- prettier
vim.keymap.set("n", "<leader>p", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("silent %!npx prettier --stdin-filepath %")
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
end)
