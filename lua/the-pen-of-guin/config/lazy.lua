-- lua/config/lazy.lua

-- Automatically install lazy.nvim if it is missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim and load everything under the lua/plugins/ directory
require("lazy").setup({
  spec = {
    { import = "the-pen-of-guin.plugins" }, 
  },
})
