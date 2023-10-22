return {
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = "<C-/>",
        block = "<C-?>",
      },
      opleader = {
        line = "<C-/>",
        block = "<C-?>",
      },
    },
    lazy = false,
  },
  {
    "m4xshen/autoclose.nvim",
    opts = {
      options = {
        disabled_filetypes = { "text" },
        disable_when_touch = true,
        pair_spaces = true,
      },
      keys = {
        ["'"] = {
          escape = true,
          close = true,
          pair = "''",
          disabled_filetypes = { "markdown" },
        },
        ["`"] = { escape = false, close = true, pair = "``" },
        ["<"] = {
          escape = false,
          close = true,
          pair = "<>",
          enabled_filetypes = { "rust" },
        },
      },
    },
  }
}
