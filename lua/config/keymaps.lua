-- overview
--
-- b: buffers
-- c: hunk changes
-- d: definition
-- e: errors
-- f: files
-- g: grep
-- j: next hunk
-- k: previous hunk
-- p: prettier
-- q: quick preview
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
vim.keymap.set("n", "<leader>c", ":Gitsigns preview_hunk_inline<CR>")
vim.keymap.set({ "n", "v" }, "<leader>s", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>u", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "<leader>j", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "<leader>k", ":Gitsigns prev_hunk<CR>")

-- prettier
vim.keymap.set("n", "<leader>p", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("silent %!npx prettier --stdin-filepath %")
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
end)

-- preview
local function has_preview()
    local wins = vim.tbl_filter(function(win)
        local config = vim.api.nvim_win_get_config(win)
        return config.relative ~= ""
    end, vim.api.nvim_list_wins())
    return #wins > 0
end

local goto_preview = require("goto-preview")
vim.keymap.set("n", "<leader>q", function()
    if has_preview() then
        goto_preview.close_all_win()
    else
        goto_preview.goto_preview_definition()
    end
end)
