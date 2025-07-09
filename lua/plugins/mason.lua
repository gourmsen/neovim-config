return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "angularls",
            "ts_ls"
        }
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {}
        },
        "neovim/nvim-lspconfig",
    },
}
