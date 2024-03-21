return {
	"majutsushi/tagbar",
	config = function()
		vim.keymap.set("n", "<leader>tg", "<cmd>Tagbar<cr>", { desc = "Enable Tags" })
	end,
}
