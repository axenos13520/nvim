return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            graphql = {
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            },
            emmet_ls = {
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
            },
            eslint = {
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        completion = { callSnippet = "Replace" },
                    },
                },
            },
            pyright = {
                settings = {
                    python = {
                        pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
                    },
                },
            },
            tailwindcss = {
                filetypes = {
                    "html",
                    "css",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "svelte",
                    "vue",
                },
            },
        },
        diagnostics = {
            underline = true,
            update_in_insert = false,
            virtual_text = { spacing = 4, prefix = "●" },
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
        },
    },
}
