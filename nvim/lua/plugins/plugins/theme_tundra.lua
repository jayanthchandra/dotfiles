return {
  {
    "sam4llis/nvim-tundra",
      priority = 1000,
    lazy = false,
    opts = {

    },
    config = function()
      vim.g.tundra_biome = 'arctic'
      vim.opt.background = 'dark'
      vim.cmd.colorscheme 'tundra'
    end
  }
}
