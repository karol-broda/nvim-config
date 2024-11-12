return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              folder = {
                arrow_closed = "▶",
                arrow_open = "▼",
              },
            },
          },
        },
        view = {
          width = 30,
          side = "left",
          mappings = {
            list = {
              { key = "H", action = "toggle_dotfiles" },
            },
          },
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
}

