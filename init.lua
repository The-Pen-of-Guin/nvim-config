-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core editor options and keymaps
require("the-pen-of-guin.core.options")
require("the-pen-of-guin.core.keymaps")

-- Load and initialize the plugin manager
require("the-pen-of-guin.plugins")
