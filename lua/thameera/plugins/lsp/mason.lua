local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

-- available servers: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
mason_lspconfig.setup({ 
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "tsserver",
    "vimls",
    "yamlls",
  },
})
