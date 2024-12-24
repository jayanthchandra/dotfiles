return {
	"natecraddock/workspaces.nvim",
	opts = {},
	config = function()
		require("workspaces").setup()
		vim.keymap.set("n", "<leader>w", "<cmd>:Telescope workspaces<cr>", { desc = "Workspaces" })
	end,
}
