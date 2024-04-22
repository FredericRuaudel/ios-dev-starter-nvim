return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      local treesitter_context = require("treesitter-context")

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

      treesitter_context.setup({
        enable = true, -- Whether to enable the plugin
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true, -- Display line numbers in the context window
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if max_lines is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
      })
    end,
  },
}
