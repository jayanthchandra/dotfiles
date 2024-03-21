return {
	"stevearc/dressing.nvim",
	opts = {
		select = {
			enabled = true,
			backend = { "telescope", "builtin" },
			builtin = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},
}
