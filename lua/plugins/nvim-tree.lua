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
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
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
          dotfiles = false,
          custom = { ".git" },
        },
        git = {
          ignore = false,
        },
        highlight_git = true,
        highlight_opened_files = "icon",
			})
    end,
  },
}

