return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set("n", "l", api.node.open.edit, opts("Open File or Directory"))
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open File or Directory"))
        vim.keymap.set("n", "o", api.node.open.edit, opts("Open File or Directory"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in Vertical Split"))

        vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
      end

      require("nvim-tree").setup({
        on_attach = on_attach, 
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
          highlight_git = true,
          highlight_opened_files = "all",
        },
        view = {
          width = 30,
          side = "left",
        },
        filters = {
          dotfiles = false,
          custom = { ".git" },
        },
        git = {
          enable = true,
          ignore = false,
        },
      })
    end,
  },
}

