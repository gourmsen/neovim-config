return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require "nvim-treesitter.configs"

        configs.setup {
            ensure_installed = {
                "lua",
                "markdown",
                "json",
                "html",
                "css",
                "scss",
                "javascript",
                "typescript",
                "angular",
                "bash",
                "sql"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            sync_install = false,
            auto_install = true
        }
    end
}
