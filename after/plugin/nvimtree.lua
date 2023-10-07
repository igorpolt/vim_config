-- disable netrw at the very start of your init.lua
local map = vim.keymap.set
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

            local ok, api = pcall(require, "nvim-tree.api")
            assert(ok, "api module is not found")
            --vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts("Tab drop"))
            local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
   -- api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

  -- custom mappings
  vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
  vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.close,        opts("Close"))
  vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

-- empty setup using defaults
require("nvim-tree").setup({
        on_attach = my_on_attach, 
    })

map("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = 'Toggle Nvim tree' })
map('n', '<leader>o', function()
    if vim.bo.filetype == "NvimTree" then
      vim.cmd.wincmd "p"
    else
      vim.cmd(":NvimTreeFocus") 
    end
end, { desc = 'NvimTree focus' })

require('nvim-web-devicons').setup({})
