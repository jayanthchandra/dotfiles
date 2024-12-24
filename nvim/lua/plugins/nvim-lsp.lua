vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto Previous diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto Next diagnostics" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		opts.desc = "LSP: [G]oto [D]efination"
		vim.keymap.set("n", "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", opts)
		opts.desc = "LSP: [G]oto [I]mplementation"
		vim.keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", opts)
		opts.desc = "LSP: [G]oto [R]eferences"
		vim.keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<cr>", opts)
		opts.desc = "LSP: [I]ncoming [C]all"
		vim.keymap.set("n", "<leader>l[", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
		opts.desc = "LSP: [O]utgoing [C]all"
		vim.keymap.set("n", "<leader>l]", "<cmd>Telescope lsp_outgoing_calls<cr>", opts)
		opts.desc = "LSP: Documentation"
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		opts.desc = "LSP: Code Action"
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		opts.desc = "LSP: Code Rename"
		vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
		opts.desc = "LSP: Show Line Error"
		vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, opts)
	end,
})

local languages = {
	"clangd",
	"html",
	"cssls",
	"tsserver",
	"eslint",
	"pyright",
	"texlab",
}

return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
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

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
		})
	end,
}
