return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local common_on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
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
          ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
        },
      })

      lspconfig.pyright.setup({ on_attach = common_on_attach })
      lspconfig.jdtls.setup({ on_attach = common_on_attach })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      local sources = {
        null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--column-width", "100" } }),
        null_ls.builtins.formatting.prettier.with({ extra_args = { "--tab-width", "2", "--single-quote", "--print-width", "80" } }),
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.shellcheck,
      }

      null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })

      vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
    end,
  },
}

