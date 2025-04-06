-- return {
--      'goolord/alpha-nvim',
--      dependencies = { 'echasnovski/mini.icons' },
--      config = function ()
--          require'alpha'.setup(require'alpha.themes.startify'.config)
--      end
-- }


return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- set the buttons
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button( "x", "  > Close buffer", ":Bdelete!<CR>"),
            dashboard.button( "b", "  > New buffer", ":enew<CR>"),
            dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
        }
        -- Set footer (optional, currently disabled)
        -- local fortune = require("alpha.fortune")
        -- dashboard.section.footer.val = fortune()

        -- Setup alpha with dashboard config
        alpha.setup(dashboard.opts)

        -- Disable folding in alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end
}
