require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    go = { "goimports", "gofmt" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    hcl = { "hcl" },
    terraform = { "terraform_fmt" },
    json = { "prettierd", "prettier", stop_after_first = true },
  },
  formatters = {
    hcl = {
      command = "/opt/homebrew/bin/terragrunt",
      args = { "hcl", "fmt", "--file", "$FILENAME" },
      stdin = false,
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}
