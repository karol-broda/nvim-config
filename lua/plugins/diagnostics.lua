return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

			local sources = {
        -- Formatters
        null_ls.builtins.formatting.stylua,             -- Lua formatter
        null_ls.builtins.formatting.ruff,               -- Ruff for Python formatter
        null_ls.builtins.formatting.prettier.with({     -- Prettier for JS, TS, HTML, CSS
          extra_filetypes = { "html", "css", "json" },
        }),
        null_ls.builtins.formatting.rustfmt,            -- Rust formatter
        null_ls.builtins.formatting.gofmt,              -- Go formatter
        null_ls.builtins.formatting.google_java_format, -- Java formatter
        -- Linters
        null_ls.builtins.diagnostics.ruff,              -- Ruff for Python linter
        null_ls.builtins.diagnostics.eslint_d,          -- ESLint for JavaScript/TypeScript
        null_ls.builtins.diagnostics.golangci_lint,     -- Go linter
        null_ls.builtins.diagnostics.luacheck,          -- Lua linter
        null_ls.builtins.diagnostics.shellcheck,        -- Shell script linter
      }
      null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
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

