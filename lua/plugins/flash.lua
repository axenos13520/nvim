return {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = {
        -- Simulate nvim-treesitter incremental selection
        {
            "<c-space>",
            mode = { "n", "o", "x" },
            function()
                require("flash").treesitter({
                    actions = {
                        ["<c-space>"] = "next",
                        ["<BS>"] = "prev"
                    }
                })
            end,
            desc = "Treesitter Incremental Selection"
        },
    },
}
