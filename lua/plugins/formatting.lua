return {
    "stevearc/conform.nvim",
    opts = {
        -- 1. Custom Formatter Arguments
        formatters = {
            clang_format = {
                prepend_args = {
                    "--style={BasedOnStyle: Google, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                },
            },
            prettier = {
                prepend_args = { "--tab-width", "4" },
            },
            stylua = {
                prepend_args = { "--indent-width", "4", "--indent-type", "Spaces" },
            },
        },

        -- 2. Language to Formatter Mapping
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            liquid = { "prettier" },
            python = { "isort", "black" },
            cpp = { "clang_format" },
            go = { "goimports", "gofumpt" },
            -- LazyVim defaults (optional to include, as they merge)
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
        },

        -- 3. Format on Save Settings
        -- LazyVim uses 'default_format_opts' instead of the top-level 'format_on_save'
        default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
        },
    },
}
