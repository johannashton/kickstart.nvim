-- nvim/lua/custom/plugins/togterm.lua

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  -- This config function is the correct place for the setup call
  config = function()
    require('toggleterm').setup {
      -- You can add configuration options here
      -- For example:
      -- size = 20,
      -- open_mapping = [[<c-\>]],
      -- direction = 'float',
      shell = 'pwsh.exe',
    }

    -- Helper function to easily set keymaps
    local function keymap(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = desc })
    end

    -- Keymap to toggle the terminal
    keymap('n', '<leader>tn', '<cmd>ToggleTerm<CR>', 'Toggle terminal')

    -- Keymap to toggle terminal in insert mode
    -- This allows you to quickly open a terminal even while typing
    --keymap('i', '<leader>t', '<esc><cmd>ToggleTerm<CR>', 'Toggle terminal')
  end,
}
