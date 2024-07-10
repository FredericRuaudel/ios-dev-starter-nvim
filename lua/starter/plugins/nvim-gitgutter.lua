-- Description: Plugin that display git information in the sign column
return {
    "airblade/vim-gitgutter",
    event = { "BufRead", "BufNewFile" },
    config = function()
        -- Optional configuration for vim-gitgutter
        vim.g.gitgutter_sign_added = "+"
        vim.g.gitgutter_sign_modified = "~"
        vim.g.gitgutter_sign_removed = "-"

        -- Define the GitStatus function in Lua
        function git_status()
            local hunk_summary = vim.fn.GitGutterGetHunkSummary()
            local added, modified, removed = hunk_summary[1], hunk_summary[2], hunk_summary[3]
            return string.format("+%d ~%d -%d", added, modified, removed)
        end

        -- Set the statusline
        vim.o.statusline = vim.o.statusline .. "%{%v:lua.git_status()%}"

        -- Keymapping
        vim.keymap.set(
            "n",
            "<leader>gge",
            "<cmd>GitGutterEnable<cr><cmd>GitGutterLineHighlightsEnable<cr><cmd>GitGutterSignsEnable<cr><cmd>GitGutterLineNrHighlightsEnable<cr>",
            { desc = "Enable GitGutter info" }
        )
        vim.keymap.set(
            "n",
            "<leader>ggd",
            "<cmd>GitGutterDisable<cr><cmd>GitGutterLineHighlightsDisable<cr><cmd>GitGutterSignsDisable<cr><cmd>GitGutterLineNrHighlightsDisable<cr>",
            { desc = "Disable GitGutter info" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>hk",
            "<cmd>GitGutterPrevHunk<cr>",
            { noremap = false, silent = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>hj",
            "<cmd>GitGutterNextHunk<cr>",
            { noremap = false, silent = true }
        )
    end,
}
