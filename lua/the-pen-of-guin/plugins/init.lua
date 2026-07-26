-- ============================================================
-- PLUGIN MANAGER INTRO
-- vim.pack intro, build hooks
-- ============================================================

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- RUns build command for plugins after they are installed or updated.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

require("the-pen-of-guin.plugins.autocomplete")
require("the-pen-of-guin.plugins.conform")
require("the-pen-of-guin.plugins.lsp")
require("the-pen-of-guin.plugins.luasnip")
require("the-pen-of-guin.plugins.telescope")
require("the-pen-of-guin.plugins.treesitter")
require("the-pen-of-guin.plugins.ui.gitsigns")
require("the-pen-of-guin.plugins.ui.which-key")
require("the-pen-of-guin.plugins.ui.colorscheme")
require("the-pen-of-guin.plugins.ui.todo-comments")
require("the-pen-of-guin.plugins.ui.mini")
require("the-pen-of-guin.plugins.ui.guess-indent")
