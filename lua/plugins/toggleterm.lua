return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            on_create = function(term)
                if vim.bo[vim.fn.bufnr("#")].filetype == "python" then
                    local venv_activate = vim.fn.getcwd() .. "/.venv/bin/activate"

                    if vim.fn.filereadable(venv_activate) == 1 then
                        term:send("source " .. venv_activate .. "\n")
                        term:send("clear")
                    end
                end
            end,
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>it", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
    end,
}
