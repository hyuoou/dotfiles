return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    cmd = {
      "DapUIToggle",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local mason = vim.fn.stdpath("data") .. "/mason/packages"

      dap.adapters = {
        lldb = {
          type = "executable",
          command = mason .. "/codelldb/extension/adapter/codelldb",
          name = "lldb",
        },
      }

      dap.configurations = {
        cpp = {
          {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
        },
      }

      dapui.setup({
        size = 0.4,
        position = "bottom",
      })

      vim.api.nvim_create_user_command("DapUIToggle", "lua require('dapui').toggle()", {})
    end,
  },
}
