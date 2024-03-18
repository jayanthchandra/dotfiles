return {
    {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "html",
        "cssls",
        "tsserver",
        "eslint",
        "tailwindcss",
        "pyright",
        "hydra_lsp",
        "sqlls",
        "bashls"
      },
      automatic_installation = true
    },
  },
}
