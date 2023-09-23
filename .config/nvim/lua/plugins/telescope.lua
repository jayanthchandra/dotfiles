return {
   {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.2",
      dependencies = { 
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
        },
      },
      init = function()
         local builtin = require("telescope.builtin")
         vim.keymap.set("n","<leader><leader>", builtin.find_files, { desc = "Find Files"})
         vim.keymap.set("n",",s", builtin.live_grep, { desc = "Live Search by Grep"})
         vim.keymap.set("n",",w",builtin.grep_string,{ desc = "Search by Word" })
         vim.keymap.set('n',",/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end, { desc = '[/] Fuzzily search in current buffer' })
         -- vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope Help" })
          require("telescope").load_extension("undo")
          vim.keymap.set("n","<leader>u","<cmd>Telescope undo<cr>", { desc = "Undo Tree" })
          vim.keymap.set("n","<leader>e",builtin.diagnostics, { desc = "Show all diagnostics" })
      end,
   },
}
