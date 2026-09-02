return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                              
                ████ ██████           █████      ██                     
               ███████████             █████                             
               █████████ ███████████████████ ███   ███████████   
              █████████  ███    █████████████ █████ ██████████████   
             █████████ ██████████ █████████ █████ █████ ████ █████   
           ███████████ ███    ███ █████████ █████ █████ ████ █████  
          ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    git = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
