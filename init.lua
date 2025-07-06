-- load core options that don't require plugins
require("config.options")

-- load plugin manager
require("config.lazy")

-- load language servers
require("config.lsp")

-- load keymaps
require("config.keymaps")

-- load autocmds
require("config.autocmds")

-- load ui configuration
require("config.ui")
