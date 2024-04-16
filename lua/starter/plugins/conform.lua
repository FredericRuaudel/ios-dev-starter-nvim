return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        swiftformat_ext = {
          command = "swiftformat",
          args = {
            "--config",
            "~/.config/nvim/.swiftformat",
            "--stdinpath",
            "$FILENAME",
          },
          range_args = function(ctx)
            return {
              "--config",
              "~/.config/nvim/.swiftformat",
              "--linerange",
              ctx.range.start .. "," .. ctx.range["end"],
            }
          end,
          stdin = true,
          condition = function(ctx)
            return vim.fs.basename(ctx.filename) ~= "README.md"
          end,
        },
      },
      formatters_by_ft = {
        swift = { "swiftformat_ext" },
        lua = { "stylua" },
      },
      --       format_on_save = function()
      --         return { timeout_ms = 500, lsp_fallback = true }
      --       end,
      log_level = vim.log.levels.ERROR,
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
