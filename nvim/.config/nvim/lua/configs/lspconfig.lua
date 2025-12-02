-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- to configure lsps further read :h vim.lsp.config
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = { "terraform_lsp", "tflint", "biome", "ts_ls", "lua_ls" }
vim.lsp.enable(servers)
