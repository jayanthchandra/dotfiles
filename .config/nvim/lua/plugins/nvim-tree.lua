return {
    {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        vim.keymap.set("n", "<leader>fb", ':NvimTreeToggle<CR>', { silent = true, desc = "File Browser"});
            git = {
        enable = true,
        ignore = true,
        timeout = 500,
    }
      }
    end,
  }
}
