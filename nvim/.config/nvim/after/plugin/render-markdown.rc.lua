local status, renderMarkdown = pcall(require, 'render-markdown')
if not status then return end

renderMarkdown.setup()
