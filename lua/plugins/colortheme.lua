return {
    "rebelot/kanagawa.nvim",
    config = function()
        -- Your kanagawa theme configuration goes here
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = false,         -- dim inactive window :h hl-NormalNC
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {
                    -- CursorLineNr = { bg = "NONE", fg = "None" },
                    -- LineNr = { fg = colors.palette.fujiGray, bg = "NONE" },
                    -- SignColumn = { bg = "NONE" },
                }
            end,
            theme = "wave",              -- Load "wave" theme when 'background' option is not set
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        })

        -- Apply the theme
        vim.cmd("colorscheme kanagawa")

        -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", fg = "NONE" })
    end
}
