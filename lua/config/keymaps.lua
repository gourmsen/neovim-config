-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>d", builtin.diagnostics)

-- tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- prettier
vim.keymap.set("n", "<leader>p", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("silent %!npx prettier --stdin-filepath %")
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
end)
