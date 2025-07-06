-- AngularLS
--
-- TypeScript is installed in the project, but the language server is installed globally
local npm_prefix = vim.fn.trim(vim.fn.system("npm config get prefix"))

vim.lsp.config("angularls", {
    cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations",
        "../..,?/node_modules", -- TypeScript (locally)
        "--ngProbeLocations",
        npm_prefix .. "/lib/node_modules/@angular/language-server/node_modules", -- Angular Language Server (globally)
        "--angularCoreVersion",
        ""
    },
    filetypes = {
        "typescript",
        "html",
        "typescriptreact",
        "typescript.tsx",
        "htmlangular"
    },
    root_markers = {
        "angular.json",
        "nx.json"
    },
})

vim.lsp.enable('angularls')
