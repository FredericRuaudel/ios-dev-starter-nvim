return {
    "tpope/vim-fugitive",
    dependencies = {
        "vim-scripts/open-browser.vim",
        "tpope/vim-rhubarb",
    },
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}
