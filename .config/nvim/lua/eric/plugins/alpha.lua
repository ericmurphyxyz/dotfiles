local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                    ",
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                    "
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "n", "  > New File", "<CMD>ene!<CR>"),
    dashboard.button( "f", "  > Find File", "<CMD>Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent Files", "<CMD>Telescope oldfiles<CR>"),
    dashboard.button( "t", "  > Find in Files", "<CMD>Telescope live_grep<CR>"),
    dashboard.button( "c", "  > Configuration", "<CMD>cd $HOME/.config/nvim | Telescope find_files<CR>"),
}
dashboard.section.buttons.opts.hl = "Comment"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
