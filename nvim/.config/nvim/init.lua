require('base')
require('global')
require('highlights')
require('maps')
require('plugins')

require('autorun')

local function has(x)
  return vim.fn.has(x) == 1
end

local is_mac = has('macunix')
local is_win = has('win32')

if is_mac then require('macos') end

if is_win then require('windows') end
