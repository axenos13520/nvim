return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "leoluz/nvim-dap-go",
            "theHamsta/nvim-dap-virtual-text",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb", "delve" },
                automatic_installation = true,
            })

            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")
            local dap_go = require("dap-go")

            require("dapui").setup({})
            require("nvim-dap-virtual-text").setup({
                commented = true, -- Show virtual text alongside comment
            })

            dap_python.setup(vim.fn.getcwd() .. "/.venv/bin/python")
            dap_go.setup({})

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "main.py",
                    program = "main.py",
                    console = "integratedTerminal"
                },
                {
                    type = "python",
                    request = "launch",
                    name = "file",
                    program = "${file}",
                    console = "integratedTerminal"
                },
            }

            dap.adapters.codelldb = {
                type = "server",
                host = "127.0.0.1",
                port = "${port}",
                executable = {

                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                    args = { "--port", "${port}" }
                }
            }

            dap.configurations.cpp = {
                {
                    name = "launch C++",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        vim.fn.system({ "bash", vim.fn.getcwd() .. "/build-debug.sh" })

                        if vim.v.shell_error ~= 0 then
                            vim.notify("Build failed, aborting debug", vim.log.levels.ERROR)
                            return nil
                        end

                        return vim.fn.getcwd() .. '/debug/app'
                    end,
                    cwd = vim.fn.getcwd(),
                    console = "integratedTerminal",
                    stopOnEntry = false,
                    args = {},
                    showDisassembly = "never"
                },
            }

            vim.fn.sign_define("DapBreakpoint", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapBreakpointCondition", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapBreakpointRejected", {
                text = "", -- or "❌"
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapStopped", {
                text = "", -- or "→"
                texthl = "DiagnosticSignWarn",
                linehl = "Visual",
                numhl = "DiagnosticSignWarn",
            })

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            local opts = { noremap = true, silent = true }

            opts.desc = "Toggle breakpoint"

            -- Toggle breakpoint
            vim.keymap.set("n", "<leader>pb", function()
                dap.toggle_breakpoint()
            end, opts)

            opts.desc = "Set conditional breakpoint"

            vim.keymap.set("n", "<leader>pB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, opts)

            opts.desc = "Continue / start debug"

            -- Continue / Start
            vim.keymap.set("n", "<leader>pc", function()
                dap.continue()
            end, opts)

            opts.desc = "Step over"

            -- Step Over
            vim.keymap.set("n", "<leader>po", function()
                dap.step_over()
            end, opts)

            opts.desc = "Step into"

            -- Step Into
            vim.keymap.set("n", "<leader>pi", function()
                dap.step_into()
            end, opts)

            opts.desc = "Step out"

            -- Step Out
            vim.keymap.set("n", "<leader>pO", function()
                dap.step_out()
            end, opts)

            opts.desc = "Terminate debugging"

            -- Keymap to terminate debugging
            vim.keymap.set("n", "<leader>pq", function()
                require("dap").terminate()
            end, opts)

            opts.desc = "Toggle DAP UI"

            -- Toggle DAP UI
            vim.keymap.set("n", "<leader>pu", function()
                dapui.toggle()
            end, opts)
        end,
    },
}
