return {
	"glepnir/lspsaga.nvim",
	branch = "main",
	requires = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		require("lspsaga").setup({
			-- keybinds for navigation in lspsaga window
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			-- use enter to open file with definition preview
			definition = {
				edit = "<CR>",
			},
			implement = {
				enable = true,
				sign = true,
			},
			ui = {
				colors = {
					normal_bg = "#022746",
				},
			},
		})
		vim.keymap.set("n", "<leader>co", ":Lspsaga outline<cr>", { silent = true, desc = "Outline Code" })
	end,
}
