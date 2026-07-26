local p = require("the-pen-of-guin.util")

-- Highlight todo, notes, etc in comments
vim.pack.add { p.gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }
