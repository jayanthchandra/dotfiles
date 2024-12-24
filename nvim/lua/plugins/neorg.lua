return {
	"nvim-neorg/neorg",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = true,
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notes/",
					},
					default_workspace = "notes",
				},
			},
		},
	},
}
