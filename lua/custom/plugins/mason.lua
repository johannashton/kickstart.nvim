-- nvim/lua/custom/plugins/mason.lua
-- This file will override the default Mason settings from kickstart.nvim

return {
  -- Make sure Mason is specified here
  'williamboman/mason.nvim',
  -- This config function will override the one from kickstart
  config = function()
    -- We are calling the default setup function first to make sure everything is initialized
    require('mason').setup()

    -- Now, we call setup again, but this time with our ensure_installed list
    -- This is a safe way to extend the default configuration
    require('mason').setup {
      ensure_installed = {
        -- Add the debug adapter
        'debugpy',

        -- Add any other linters or formatters you want Mason to manage
        --'black',
        --'flake8',
      },
    }
  end,
}
