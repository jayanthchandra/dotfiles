vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto Previous diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto Next diagnostics" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    opts.desc = "LSP: [G]oto [D]efination"
    vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", opts)
    opts.desc = "LSP: [G]oto [I]mplementation"
    vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", opts)
    opts.desc = "LSP: [G]oto [R]eferences"
    vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", opts)
    opts.desc = "LSP: [I]ncoming [C]all"
    vim.keymap.set("n", "<leader>l[", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
    opts.desc = "LSP: [O]utgoing [C]all"
    vim.keymap.set("n", "<leader>l]", "<cmd>Telescope lsp_outgoing_calls<cr>", opts)
    opts.desc = "LSP: Symbols"
    vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
    opts.desc = "LSP: Documentation"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    opts.desc = "LSP: Format"
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
  end,
})

local languages = {
  "clangd",
  "html",
  "cssls",
  "tsserver",
  "emmet_ls",
  "eslint",
  "pyright",
  "texlab",
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "describe", "it" },
            },
          },
        },
      })

      for _, language in pairs(languages) do
        require("lspconfig")[language].setup({
          capabilities = capabilities,
        })
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
          })
    end,
  },
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
        "pyright"
      },
    },
  },
}
