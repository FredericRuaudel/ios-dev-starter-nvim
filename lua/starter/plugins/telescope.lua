return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      ensure_installed = { "swift" },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require("telescope.builtin")

    keymap.set(
      "n",
      "<leader>ff",
      builtin.find_files,
      { desc = "Fuzzy find all files in cwd" }
    )
    -- keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep in cwd" })
    keymap.set("n", "<leader>fg", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Live grep in cwd" })
    keymap.set("n", "<C-p>", builtin.git_files, { desc = "Fuzzy find git file search" })
  end,
}
