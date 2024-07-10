-- Description: Plugin to use GitHub Copilot in Neovim
return {
    "github/copilot.vim",
    config = function()
        --        local copilot = require('copilot.vim')
        --        copilot.setup({})
        -- vim.g.copilot#enable()
        vim.keymap.set("i", "<leader>cl", "<Plug>(copilot-accept-word)")
        vim.keymap.set("i", "<leader>cn", "<Plug>(copilot-next)")
    end,
}
