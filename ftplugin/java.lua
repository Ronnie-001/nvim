-- Java Setup
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end

local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  vim.notify("nvim-dap not found, please install it!")
  return
end

local jdtls_dir = vim.fn.stdpath('data') .. '/mason/share/jdtls'
local config_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux'

-- local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:h')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name

local f = io.open(workspace_dir, "r")
if f == nil then
    os.execute("mkdir " .. workspace_dir)
end

-- Needed for debugging
local bundles = {
  vim.fn.glob(vim.fn.stdpath('data') .. '/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath('data') .. "/mason/share/java-test/*.jar", 1), "\n"))

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
  cmd = {
    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. jdtls_dir .. '/lombok.jar',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', jdtls_dir .. '/plugins/org.eclipse.equinox.launcher.jar',
    '-configuration', config_dir,
    '-data', workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root({ '.project', '.git', 'mvnw', 'pom.xml', 'build.gradle', 'src' }),

  settings = {
    java = {
      eclipse = { downloadSources = true, },
      maven = { downloadSources = true, },
      implementationsCodeLens = { enabled = true, },
      referencesCodeLens = { enabled = true, },
      references = { enabled = true, },
      signatureHelp = { enabled = true },

      project = {
        outputPath = "bin",
        sourcesPaths = { "src", "test" }
      },

      configuration = {
        updateBuildConfiguration = "interactive",
      },

      format = {
        enabled = true,
        comments = true,
        settings = {
          url = vim.fn.stdpath('config') .. '/utils/eclipse-java-google-style.xml',
          profile = 'GoogleStyle',
        },
      },
    },


    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      },
    },

    extendedClientCapabilities = extendedClientCapabilities,

    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },

  -- Needed for auto-completion with method signatures and placeholders
  capabilities = require('cmp_nvim_lsp').default_capabilities(),

  init_options = {
    bundles = bundles,
  },

}

config.on_attach = function(client, bufnr)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })

  local status_ok, jdtls_dap = pcall(require, "jdtls.dap")
  if status_ok then
    jdtls_dap.setup_dap_main_class_configs()
  end
  --   require('keymaps').map_java_keys(bufnr)

  vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
  vim.keymap.set('n', "<leader>tc", jdtls.test_class, { desc = 'Test class', buffer = bufnr })
  vim.keymap.set('n', "<leader>tm", jdtls.test_nearest_method, { desc = 'Test method', buffer = bufnr })
  vim.keymap.set('n', '<leader>lrv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
  vim.keymap.set('v', '<leader>lrm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { desc = 'Extract method', buffer = bufnr })
  vim.keymap.set('n', '<leader>lrc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })
end

local main_class = "com.ronapps.ecommercepi.EcommerceApiApplication" 

dap.configurations.java = {
  {
    type = "java",
    request = "launch",
    name = "Launch Main",
    mainClass = main_class,
    projectName = "YourProjectName",
  },
}

jdtls.start_or_attach(config)
