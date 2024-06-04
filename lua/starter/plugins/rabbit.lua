return {
    "voxelprismatic/rabbit.nvim",
    config = function()
        require("rabbit").setup({ { default_mapping = true } })
    end,
}
