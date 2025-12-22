-- available servers: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local servers = {
  bashls = {},
  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },
  dockerls = {},
  gopls = {},
  html = {
    init_options = {
      configurationSection = { "html", "css", "javascript" },
    },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
  jsonls = {},
  lua_ls = {},
  marksman = {},
  pyright = {},
  tailwindcss = {},
  ts_ls = {},
  vimls = {},
  yamlls = {},
}

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>x", vim.diagnostic.open_float, { silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- on_attach fn with keybindings
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

return {
  -- mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      local lspconfig = require("lspconfig")

      for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        opts.on_attach = on_attach
        lspconfig[server].setup(opts)
      end
    end,
  }
}
