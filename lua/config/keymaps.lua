-- overview
--
-- b: buffers
-- c: changes (hunk preview)
-- d: definition
-- e: errors
-- f: files
-- g: grep
-- i: diff with file
-- j: next hunk
-- k: previous hunk
-- l: lazygit
-- p: format with conform
-- q: quick preview
-- r: references
-- s: stage hunk
-- t: tree
-- u: undo stage hunk
-- v: diffview
-- w: workspace
-- x: close tab
-- z: reset hunk

-- lsp
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "Definition" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Files" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>r", builtin.lsp_references, { desc = "References" })

-- trouble
vim.keymap.set("n", "<leader>e", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })

-- tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Tree View" })

-- gitsigns
vim.keymap.set("n", "<leader>c", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview Hunk" })
vim.keymap.set({ "n", "v" }, "<leader>s", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
vim.keymap.set("n", "<leader>u", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Hunk" })
vim.keymap.set("n", "<leader>j", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
vim.keymap.set("n", "<leader>k", ":Gitsigns prev_hunk<CR>", { desc = "Previous Hunk" })
vim.keymap.set("n", "<leader>z", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

-- diffview
vim.keymap.set("n", "<leader>v", ":DiffviewOpen<CR>", { desc = "DiffView" })

-- auto session
vim.keymap.set("n", "<leader>w", ":AutoSession search<CR>", { desc = "Workspaces" })

-- lazygit
vim.keymap.set("n", "<leader>l", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- format
vim.keymap.set("n", "<leader>p", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
    })
end, { desc = "Format" })

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
end, { desc = "Preview Definition" })

-- diff current buffer against a file chosen through telescope
local function diff_with_file()
    builtin.find_files({
        -- modify mappings to add custom action
        attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local choose_file = function()
                -- get selected file
                local entry = action_state.get_selected_entry()

                -- close telescope
                actions.close(prompt_bufnr)

                -- remember current buffer and open a new tab with a vertical diff
                local current_buf = vim.api.nvim_get_current_buf()
                vim.cmd("tabnew")
                vim.api.nvim_set_current_buf(current_buf)
                vim.cmd("vert diffsplit " .. vim.fn.fnameescape(entry.value))
            end

            -- set modified mappings
            map("i", "<CR>", choose_file)
            map("n", "<CR>", choose_file)

            return true
        end,
    })
end

vim.keymap.set("n", "<leader>i", diff_with_file, { desc = "Compare Buffer" })

-- close tab
vim.keymap.set("n", "<leader>x", ":tabclose<CR>", { desc = "Close Tab" })

-- centered search
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
