-- /lua/plugins/dap.lua
return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            ensure_installed = { "python", "codelldb" },
            automatic_installation = true,
            -- Handlers allow mason-nvim-dap to configure the adapters for you
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        },
    },

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Python adapter and configuration
            dap.adapters.python = {
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
            }

	    local util = require("lspconfig.util")

	    dap.configurations.python = {
		{
		    type = "python",
		    request = "launch",
		    name = "Launch current module",

		    pythonPath = function()
			return vim.fn.exepath("python")
		    end,

		    module = function()
			local root = util.root_pattern(".git")(vim.fn.expand("%:p"))

			if not root then
			    error("Could not determine project root")
			end

			local file = vim.fn.expand("%:p")
			local rel = file:gsub("^" .. vim.pesc(root .. "/"), "")

			return rel:gsub("%.py$", ""):gsub("/", ".")
		    end,

		    cwd = function()
			return util.root_pattern(".git")(vim.fn.expand("%:p"))
			    or vim.fn.getcwd()
		    end,
		},
	    }

            dapui.setup()

            -- UI Listeners
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- Keymaps for debugging with dap
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step Out" })
            vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
            vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
        end,
    },
}
