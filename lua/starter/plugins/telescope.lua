-- Description: Find, Filter, Preview, Pick.
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            ensure_installed = { "swift" },
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-h>"] = actions.select_horizontal,
                        ["<C-l>"] = actions.select_vertical,
                    },
                    n = {
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["h"] = actions.select_horizontal,
                        ["l"] = actions.select_vertical,
                    },
                },
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        local builtin = require("telescope.builtin")

        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find all files in cwd" })
        keymap.set("n", "<leader>fg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Live grep in cwd" })
        keymap.set("n", "<leader>cg", function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
        end, { desc = "Live grep in cwd" })
        keymap.set("n", "<C-p>", builtin.git_files, { desc = "Fuzzy find git file search" })
        keymap.set("n", "<leader>fr", "<leader>yiw<leader>fg<M-C>", { desc = "Fuzzy find word under cursor" })
    end,
}
