-- Description: Git wrapper for vim
return {
    "tpope/vim-fugitive",
    dependencies = {
        "vim-scripts/open-browser.vim",
        "tpope/vim-rhubarb",
    },
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        local function git_pop_stash_file(filename)
            vim.cmd("Git checkout stash@{0} -- " .. filename)
        end
        vim.keymap.set("n", "<leader>gpf", function()
            local filename = vim.fn.expand("%")
            git_pop_stash_file(filename)
        end)
    end,
}
