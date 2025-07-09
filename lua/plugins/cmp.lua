return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- snippet bridge
        "rafamadriz/friendly-snippets", -- collection of snippets
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load() -- enable friendly-snippets

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm choice
                ["<C-Space>"] = cmp.mapping.complete(), -- manually trigger menu
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next item
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous item
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" }
            })
        })
    end
}
