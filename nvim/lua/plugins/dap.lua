return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- fancy UI for the debugger
		{
			"rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap: UI", mode = { "n" } },
        { "<leader>de", function() require("dapui").eval() end,     desc = "Dap: Eval",  mode = { "n", "v" } },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Dap: Toggle Breakpoint", mode = {"n", "v"} },
        { "<leader>dr", function() require("dapui").open({ reset = true }) end, desc = "Dap: Resize UI", mode = {"n"} }
      },
			opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
				vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
				vim.keymap.set("n", "<F5>", require("dap").continue)
				vim.keymap.set("n", "<F10>", require("dap").step_over)
				vim.keymap.set("n", "<F11>", require("dap").step_into)
				vim.keymap.set("n", "<F12>", require("dap").step_out)
				vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					"python",
					"codelldb",
					"js",
				},
			},
		},
	},
}
