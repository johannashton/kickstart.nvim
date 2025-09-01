return {
  -- The core DAP plugin
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- UI for DAP
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        -- It's a good idea to pin to a stable version
        tag = 'v4.0.0',
        config = function()
          local dapui = require 'dapui'
          dapui.setup()

          -- Add listeners to open/close the UI automatically
          local dap = require 'dap'
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
    },
    -- Basic keymaps for debugging. These are inspired by VS Code's defaults.
    keys = {
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'DAP: Continue',
      },
      {
        '<F10>',
        function()
          require('dap').step_over()
        end,
        desc = 'DAP: Step Over',
      },
      {
        '<F11>',
        function()
          require('dap').step_into()
        end,
        desc = 'DAP: Step Into',
      },
      {
        '<F12>',
        function()
          require('dap').step_out()
        end,
        desc = 'DAP: Step Out',
      },
      {
        '<leader>b',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'DAP: Toggle Breakpoint',
      },
      {
        '<leader>B',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'DAP: Set Conditional Breakpoint',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.open()
        end,
        desc = 'DAP: Open REPL',
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = 'DAP: Run Last',
      },
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        desc = 'DAP: Toggle UI',
      },
    },
  },

  -- The Python-specific DAP configuration helper
  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
      -- The setup function will automatically use the python interpreter from
      -- the virtual environment selected by venv-selector.
      require('dap-python').setup 'python'
    end,
  },
}
