-- Set leader key to spacebar for easier access
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness, we set options to avoid repeating the same parameters
local opts = { noremap = true, silent = true }

-- Disable the default behavior of the spacebar key in Normal and Visual modes
-- This ensures spacebar doesn't do anything by default
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move the cursor through wrapped lines using hjkl (Down and Up)
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search highlight when pressing Esc
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Save file using Ctrl + s (standard shortcut)
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Save file without auto-formatting using <leader> + sn
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Quit the file with Ctrl + q (standard shortcut)
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- Delete a single character without saving it to the clipboard
vim.keymap.set('n', 'x', '"_x', opts)

-- Scroll the page down or up while keeping the cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find the next or previous search result and keep the cursor centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize the window using arrow keys
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts) -- Shrink window width
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts) -- Expand window height
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts) -- Shrink window height
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts) -- Expand window width

-- Switch between open buffers (tabs in Vim)
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts) -- Next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts) -- Previous buffer
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- Close the current buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- Open a new buffer

-- Increment and decrement numbers with <leader> + + or <leader> + -
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- Increment number under the cursor
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- Decrement number under the cursor

-- Manage window splits (dividing the screen into multiple windows)
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- Split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- Split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- Make split windows equal size
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- Close the current split window

--  Navigate between splits using CTRL + HJKL
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts) -- Move to the split left
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts) -- Move to the split below
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts) -- Move to the split above
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts) -- Move to the split right

-- Tabs management (open, close, next, previous)
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- Open a new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- Close the current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) -- Go to the next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) -- Go to the previous tab

-- Toggle line wrapping (long lines wrap around instead of scrolling)
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Quickly exit insert mode by pressing jk or kj
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Keep indenting when you press < and > in Visual mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move selected text up or down in Visual mode
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts) -- Move selected text down
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts) -- Move selected text up

-- Keep the last yanked text when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace the word under the cursor with a new word using <leader>j
vim.keymap.set('n', '<leader>j', '*`cgn', opts)

-- Explicitly yank to system clipboard (copy selected text or whole line)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]]) -- Copy to clipboard in normal or visual mode
vim.keymap.set('n', '<leader>Y', [["+Y]]) -- Copy the whole line to clipboard in normal mode

-- Toggle diagnostics (error/warning messages) on and off
local diagnostics_active = true
vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Navigate through diagnostics (errors/warnings)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session (remember your working state)
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false }) -- Save session
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false }) -- Load session

