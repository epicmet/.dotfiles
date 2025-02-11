-- This plugin is much faster than Gitsigns toggle blame
return {
  'f-person/git-blame.nvim',
  opts = {
    enabled = false, -- Disable by default, Enable with :GitBlameToggle
    message_template = ' <summary> • <date> • <author> • <<sha>>',
    date_format = '%d-%m-%Y %H:%M:%S',
    virtual_text_column = 1,
  },
}
