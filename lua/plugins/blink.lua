return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },
            ["<CR>"] = { "accept", "fallback" },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        },
        appearance = { nerd_font_variant = "mono" },
        completion = { documentation = { auto_show = false } },
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
