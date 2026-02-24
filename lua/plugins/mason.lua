return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "angularls",
            "ts_ls",
            "lua_ls",
            "markdown_oxide",
            "tailwindcss",
            "rust_analyzer",
        },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        "neovim/nvim-lspconfig",
    },
}
