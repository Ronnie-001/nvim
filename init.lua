require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

-- Turn off semantic tokens so it stops messing with my kanagawa theme
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});

vim.opt.rtp:prepend(lazypath)

-- Disable inbuilt jdtls support
vim.g.jdtls_enabled = false

require('lazy').setup({
    -- require 'plugins.neotree',
    require 'plugins.colortheme',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.LSP',
    require 'plugins.discord',
    require 'plugins.indent-blankline',
    require 'plugins.autocompletion',
    require 'plugins.alpha',
    -- require 'plugins.notification_deamon',
    require 'plugins.jdtls',
    require 'plugins.dap',
    require 'plugins.neotest',
    require 'plugins.oil'
    -- require 'plugins.mini-files'
})


