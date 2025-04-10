vim.wo.number = true

vim.opt.showmode = false
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse = 'a'
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.updatetime = 300  -- Faster completion (default is 4000ms)
vim.o.timeoutlen = 500  -- Faster which-key popup
vim.o.ttimeoutlen = 10  -- Reduce key timeout delay
vim.o.lazyredraw = true -- Speed up macros and scrolling

vim.wo.relativenumber = true  -- Hybrid line numbers (absolute on current line, relative elsewhere)
vim.o.cursorline = true       -- Highlight the current line
vim.o.signcolumn = "yes"      -- Always show the sign column (prevents UI shift)
vim.o.scrolloff = 8           -- Keep some lines above/below the cursor
vim.o.sidescrolloff = 8       -- Same for horizontal scrolling

vim.o.undofile = true      -- Enable persistent undo
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"  -- Store undo history
vim.o.backup = false       -- Disable backup files
vim.o.swapfile = false     -- Disable swap files

vim.o.incsearch = true     -- Live preview while searching
vim.o.hlsearch = true      -- Highlight search matches
vim.o.wildmenu = true      -- Enhanced command-line completion

vim.o.paste = false             -- Prevent auto-indenting when pasting

