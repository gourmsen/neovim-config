return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm choice
                ["<C-Space>"] = cmp.mapping.complete(), -- manually trigger menu
            }),
            sources = cmp.config.sources({
                { name = "buffer" },
                { name = "path" }
            })
        })
    end
}
