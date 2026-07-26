local p = require("the-pen-of-guin.util")

vim.pack.add { p.gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}
