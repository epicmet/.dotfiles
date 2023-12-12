local status, jdtls = pcall(require, 'jdtls')
local status1, jdtls_setup = pcall(require, 'jdtls.setup')
if not status then
  print('Could not find jdtls')
  return
end

if not status1 then
  print('Could not find jdtls.setup')
  return
end

local home = os.getenv('HOME')

local java_path = home .. '/.sdkman/candidates/java/21.0.1-oracle/bin/java'

local jar_path = home
  .. '/.local/share/nvim/mason'
  .. '/packages/jdtls/plugins'
  .. '/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar'
--   .. '/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.700.v20221108-1024.jar'

local configuration_path = home .. '/.local/share/nvim/mason/packages/jdtls'
if IS_MAC then
  configuration_path = configuration_path .. '/config_mac'
elseif IS_LINUX then
  configuration_path = configuration_path .. '/config_linux'
elseif IS_WIN then
  configuration_path = configuration_path .. '/config_win'
else
  print('JDTLS: Unsupported OS')
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.local/share/nvim/java-workspace/' .. project_name

local config = {
  cmd = {
    java_path,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    jar_path,
    '-configuration',
    configuration_path,
    '-data',
    workspace_dir,
  },

  root_dir = jdtls_setup.find_root({ '.git', 'mvnw', 'gradlew' }),

  -- eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      format = {
        enabled = true,
        tabSize = 4,
        settings = {
          profile = 'Google',
        },
      },
    },
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  -- TODO: Java debug
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
