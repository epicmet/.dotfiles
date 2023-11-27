local status, ts_context_commentstring = pcall(require, 'ts_context_commentstring')
if not status then return end

ts_context_commentstring.setup({})
