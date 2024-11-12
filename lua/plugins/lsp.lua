return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local common_on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
      end

      lspconfig.lua_ls.setup({
        on_attach = common_on_attach,
	cmd = { "lua-language-server" },
	settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      lspconfig.rust_analyzer.setup({
        on_attach = common_on_attach,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
          },
        },
      })

      lspconfig.ts_ls.setup({
        on_attach = common_on_attach,
      })

      lspconfig.pyright.setup({
        on_attach = common_on_attach,
      })

      lspconfig.jdtls.setup({
        on_attach = common_on_attach,
      })
    end,
  },
}

