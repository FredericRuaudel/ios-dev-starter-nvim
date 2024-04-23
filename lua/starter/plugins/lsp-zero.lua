return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",       -- source for text in buffer
        "hrsh7th/cmp-path",         -- source for file system paths
        "hrsh7th/cmp-nvim-lsp",     -- source for LSP server
        "L3MON4D3/LuaSnip",         -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim",     -- vs-code like pictograms
    },
    config = function()
        local lsp = require("lsp-zero")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        lsp.preset("recommended")
        lsp.setup()
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)
        local lspconfig = require("lspconfig")
        lspconfig["sourcekit"].setup({
            single_file_support = false,
            on_attach = function(client, bufnr)
                print("hello sourcekit")
                lsp.default_keymaps({ buffer = bufnr })
            end,
            capabilities = capabilities,
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            -- Replace the language servers listed here
            -- with the ones you want to install
            ensure_installed = {
                "tsserver",
                "kotlin_language_server",
                "lua_ls",
                "marksman",
                "basedpyright",
                "sqlls",
                "taplo",
                "lemminx",
                "yamlls",
                "gradle_ls",
                "html",
                "jsonls",
                "cssls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            },
        })

        local cmp = require("cmp")
        local cmp_format = require("lsp-zero").cmp_format({ details = true })
        local luasnip = require("luasnip")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            },
            --- (Optional) Show source name in completion menu
            formatting = cmp_format,

            completion = {
                completeopt = "menu,menuone,preview",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),    -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
                ["<C-b>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-f>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
        })
    end,
}
