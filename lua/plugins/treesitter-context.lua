return {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 5,
            min_window_height = 0,
            multiline_threshold = 20,
            trim_scope = "outer",
            mode = "cursor",
            separator = "-",
            zindex = 20,
            on_attach = nil,
        })
    end,
}
