return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep"
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<C-d>"] = actions.delete_buffer
                    },
                },
                path_display = { "truncate" },
            },
            pickers = {
                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                }
            },
        }
    end
}
