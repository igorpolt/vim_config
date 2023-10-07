require("bufferline").setup{
  options = {
    offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true
                }
            }
  }
}

vim.keymap.set('n', '<leader>h', "<cmd>:bp<CR>", { desc = 'Change to prev buffer',noremap = true, silent = true}) 
vim.keymap.set('n', '<leader>l', "<cmd>:bn<CR>", { desc = 'Change to next buffer',noremap = true, silent = true}) 
vim.keymap.set('n', '<leader>c', "<cmd>:bd<BAR>:bp<CR>", { desc = 'Close buffer',noremap = true, silent = true}) 
vim.keymap.set('n', '<leader>s', "<cmd>:w<CR>", { desc = 'Save buffer',noremap = true, silent = true}) 
