P = function(v)
  print(vim.inspect(v))
  return v
end

local os = vim.loop.os_uname().sysname

-- true if the OS is Mac
IS_MAC = os == 'Darwin'
-- true if the OS is Linux
IS_LINUX = os == 'Linux'

-- true if the OS is Windows
IS_WIN = os == 'Win32'
