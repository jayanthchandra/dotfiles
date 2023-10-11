return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {

    },
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end

  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      -- char = '┊',
      -- show_trailing_blankline_indent = false,
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        separator_style = "slant",
        mode = "tabs",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
            padding = 1
          },
        },
      },
    },
    config = function()
      require("bufferline").setup {}
      vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
    end,
  }
}
