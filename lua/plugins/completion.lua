return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "thick",
          always_show_bufferline = true,
          enforce_regular_tabs = true,
          max_name_length = 18,
          max_prefix_length = 15,
          color_icons = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              highlight = "Directory",
            },
          },
        },
        highlights = {
          fill = { bg = "#1e222a" },
          background = { fg = "#5c6370", bg = "#282c34" },
          buffer_selected = { fg = "#61afef", bold = true, italic = false },
          buffer_visible = { fg = "#abb2bf" },
          separator = { fg = "#282c34", bg = "#1e222a" },
          separator_selected = { fg = "#61afef" },
          separator_visible = { fg = "#3e4452" },
          indicator_selected = { fg = "#61afef", bg = "#1e222a", underline = true, bold = true },
        },
      })
    end,
  },
}

