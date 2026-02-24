return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
            htmlangular = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            lua = { "stylua" },
            rust = { "rustfmt" },
        },
        format_on_save = false,
    },
}
