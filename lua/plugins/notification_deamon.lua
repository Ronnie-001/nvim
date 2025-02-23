-- lua/plugins/notification_deamon.lua

return {
  -- 1) Set up nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        -- This is the color used for transparency calculations
        background_colour = "#000000",
      })
    end,
  },

  -- 2) Set up Noice, which can use nvim-notify for its notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- Ensure nvim-notify is loaded before Noice so Noice can use it
      "rcarriga/nvim-notify",
    },
    opts = {
      -- Put your Noice configuration here
      -- (the background_color field you had before is not recognized by Noice)
    },
  },
}
