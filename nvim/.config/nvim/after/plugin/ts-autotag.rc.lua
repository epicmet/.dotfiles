local status, autotag = pcall(require, 'ts-autotag')
if (not status) then return end

autotag.setup {}
