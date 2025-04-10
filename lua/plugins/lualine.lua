return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local custom_iceberg = require('lualine.themes.iceberg_dark')

    -- Override normal and command mode 'a' section to be turquoise
    local turquoise = '#755db0'

    custom_iceberg.normal.a.bg = turquoise
    custom_iceberg.normal.a.fg = '#000000'
    custom_iceberg.normal.a.gui = 'bold'

    custom_iceberg.command = {
      a = {
        bg = turquoise,
        fg = '#000000',
        gui = 'bold'
      }
    }

    -- Arrow.nvim statusline integration
    local arrow_status = require('arrow.statusline')
    local function arrow_component()
      return arrow_status.text_for_statusline_with_icons()
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_iceberg,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            arrow_component,
            color = { fg = '#f38ba8', gui = 'bold' }  -- 🎯 custom color for arrow icon
          },
          'filename'
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
