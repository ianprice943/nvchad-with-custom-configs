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

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local macos_install_location = "/opt/homebrew/Cellar/elixir-ls/0.22.1/libexec/language_server.sh"
local linux_install_location = "/home/linuxbrew/.linuxbrew/Cellar/elixir-ls/0.22.1/libexec/language_server.sh"

if file_exists(macos_install_location) then
  lspconfig.elixirls.setup {
    cmd = {macos_install_location};
  }
elseif file_exists(linux_install_location) then
  lspconfig.elixirls.setup {
    cmd = {linux_install_location};
  }
end


