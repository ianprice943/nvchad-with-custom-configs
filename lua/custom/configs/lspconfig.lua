local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
  "tsserver",
  "tailwindcss",
  "eslint",
  "cssls",
  "gdscript",
  "golangci_lint_ls",
  "gopls",
  "html",
  "rust_analyzer",
  "svelte",
  "vuels"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  cmd = {"/opt/homebrew/Cellar/elixir-ls/0.22.1/libexec/language_server.sh"};
}
