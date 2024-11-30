return {{
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = false,
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },
      })

      vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true })
    end,
}}

