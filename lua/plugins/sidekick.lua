return {
    "folke/sidekick.nvim",
    opts = {
        nes = {
            enabled = false,
        },
        cli = {
            win = {
                layout = "right",
                split = {
                    width = 80,
                    height = 20,
                }
            },
            mux = {
                enabled = true,
                backend = "tmux",
            },
        }
    },
    keys = {
        {
            "<leader>ai",
            function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end,
            desc = "Sidekick Toggle Copilot",
        },
        {
            "<leader>at",
            function() require("sidekick.cli").send({ name = "copilot", focus = true, msg = "{this}" }) end,
            mode = { "x", "n" },
            desc = "Send This",
        },
        {
            "<leader>ad",
            function() require("sidekick.cli").send({ name = "copilot", focus = true, msg = "{diagnostics}" }) end,
            mode = { "x", "n" },
            desc = "Send Diagnostics",
        },
    },
}
