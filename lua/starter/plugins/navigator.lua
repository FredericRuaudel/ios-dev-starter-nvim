-- Description: Code analysis & navigation plugin using LSP
return {
  "ray-x/navigator.lua",
  dependencies = {
    "ray-x/guihua.lua",
    "VonHeikemen/lsp-zero.nvim",
    "nvim-treesitter/nvim-treesitter-refactor",
  },
  config = function()
    require("navigator").setup({
      default_mapping = true,
      format_on_save = false,
      keymaps = {
        -- Override the default keymap
        { key = "K", func = vim.lsp.buf.signature_help, desc = "signature_help" },
      },
    })
  end,
}
