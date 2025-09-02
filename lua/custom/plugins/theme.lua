return {
  {
    'Mofiqul/vscode.nvim',
    lazy = false,    -- We want to load this at startup
    priority = 1000, -- Make sure it loads before other plugins
    config = function()
      -- setup the theme
      require('vscode').setup({
        -- You can override the style here, for example: 'darker' or 'light'
        style = 'dark',

        -- You can toggle italic comments
        italic_comments = true,

        -- You can disable background transparency
        transparent = false,
      })

      -- Load the colorscheme
      vim.cmd.colorscheme 'vscode'
    end,
  },
}
