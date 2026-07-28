local p = require("the-pen-of-guin.util")

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add { p.gh 'folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}

vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim"
})
require("gruvbox").setup()

-- Load the colorscheme here.
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
