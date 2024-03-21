return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"c",
					"cpp",
					"python",
					"lua",
					"vim",
					"javascript",
					"html",
					"css",
					"comment",
					"vimdoc",
					"tsx",
					"json",
					"typescript",
					"markdown",
					"bash",
					"dockerfile",
					"gitignore",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
}
