-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {"lunarvim/colorschemes"},
  { "folke/tokyonight.nvim" },
  { "marko-cerovac/material.nvim" },
  { "rebelot/kanagawa.nvim" },
  {"catppuccin/nvim"},
  {"projekt0n/github-nvim-theme"},
  {"haystackandroid/rusticated"},
  {"rose-pine/neovim"},
  {"yorik1984/newpaper.nvim"},
}
lvim.colorscheme = "newpaper"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
