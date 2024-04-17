return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        incremental_selection = {
          enable = false,
          keymaps = {
            scope_incremental = "a",
            node_decremental = "z",
          },
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- indent = { enable = true },
        autotag = { enable = false },
        ensure_installed = {
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "lua",
          "gitignore",
          "swift",
          "kotlin",
          "objc",
          "ruby",
          "python",
          "sql",
          "tmux",
          "toml",
          "vim",
          "vimdoc",
          "xml",
          "diff",
          "html",
          "javascript",
          "typescript",
          "jq",
          "llvm",
          "mermaid",
        },
        sync_install = false,
        auto_install = true,
      })
    end,
  },
}
