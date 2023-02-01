require("tokyonight").setup({
  style = "night",
  transparent = true,
  styles = {
    floats = "transparent", -- style for floating windows
  },
})

vim.cmd [[colorscheme tokyonight]]
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
