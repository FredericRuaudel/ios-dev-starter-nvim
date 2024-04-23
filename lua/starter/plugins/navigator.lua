return {
    "ray-x/navigator.lua",
    dependencies = {
        'ray-x/guihua.lua',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter-refactor',
    },
    config = function()
        require('navigator').setup({})
    end,
}
