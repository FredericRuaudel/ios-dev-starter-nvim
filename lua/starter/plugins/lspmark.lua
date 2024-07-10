-- Description: Plugin for bookmarking LSP locations with comments
return {
    "tristone13th/lspmark.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("lspmark").setup()
        require("telescope").load_extension("lspmark")

        vim.keymap.set("n", "<leader>b", function()
            require("lspmark").toggle_bookmark({ with_comment = false })
        end)
        vim.keymap.set("n", "<leader>bc", function()
            require("lspmark").toggle_bookmark({ with_comment = true })
        end)
        vim.keymap.set("n", "<leader>be", function()
            require("lspmark").modify_comment()
        end)
        vim.keymap.set("n", "<leader>bs", function()
            require("lspmark").show_comment()
        end)
        vim.keymap.set("n", "<leader>bl", "<cmd>Telescope lspmark")
    end,
}
