return {
  'echasnovski/mini.files',
  ---@module 'mini.files'
  ---@type mini.files.SetupOpts
  opts = {
    -- You can add any default configuration options here, like:
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      use_as_default_explorer = false,  -- Set to true if you want mini.files as your default file explorer
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },  -- Use if you want web devicons support
  config = function()
    require('mini.files').setup({
      -- You can override or set additional options here
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        use_as_default_explorer = false,  -- Adjust to true if you prefer to use mini.files as default explorer
      },
    })
  end,
  -- Lazy loading is not recommended for mini.files
  lazy = false,
}
