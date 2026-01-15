return {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
        require("lsp_signature").setup({
            bind = true,
            hint_enable = false, -- show inline hints at the cursor
            hint_prefix = "➤ ", -- symbol before parameter hints
            floating_window = true, -- show signature in floating window
            floating_window_above_cur_line = true,
            handler_opts = {
                border = "rounded" -- single/double/shadow/none
            },
            transparency = 5,      -- 0–100 transparency for floating window
            always_trigger = false,
            toggle_key = "<M-x>",  -- press Alt-x to toggle signature help
        })
    end,
}
