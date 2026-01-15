return {
    "folke/snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                header = [[
           ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
           ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
           ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
           ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

                keys = {
                    { icon = " ", key = "e", desc = "New File", action = ":ene" },
                    { icon = " ", key = "ee", desc = "Toggle file explorer", action = ":NvimTreeToggle" },
                    { icon = "󰱼 ", key = "ff", desc = "Find File", action = ":Telescope find_files" },
                    { icon = " ", key = "fs", desc = "Find Word", action = ":Telescope live_grep" },
                    { icon = "󰁯 ", key = "wr", desc = "Restore Session", action = ":AutoSession restore" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
