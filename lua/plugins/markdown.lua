return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        checkbox = {
            left_pad = 3,
            custom = {
                waiting = { raw = "[~]", rendered = " ", highlight = "RenderMarkdownWarn" },
            },
        },
    },
}
