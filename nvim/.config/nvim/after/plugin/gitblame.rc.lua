local status, gitblame = pcall(require, 'gitblame')
if not status then return end

gitblame.setup({
  enabled = false, -- Disable by default, Enable with :GitBlameToggle
  message_template = ' <summary> • <date> • <author> • <<sha>>', -- template for the blame message, check the Message template section for more options
  date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
  virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
})