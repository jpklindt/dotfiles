return {
  {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true, 
      auto_trigger = true,
      keymap = {
        accept = "<M-l>",
        accept_word = "<M-ö>",
        next = "<M-ü>",
        prev = "<M-ä>",
        },
      },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  }
}
